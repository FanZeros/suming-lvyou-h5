-- ============================================================================
-- ThemeOverlay - 暗黑画风全局覆盖层（LOCAL_MODE 单机版专用）
-- 职责: 在每帧 NanoVG 渲染的**最后**绘制全局氛围层：
--       1. 冷暗色调罩（全屏半透明深蓝黑，统一压暗全部界面）
--       2. 径向暗角（边缘暗紫黑渐变，暗黑系经典氛围）
-- 用法: ThemeOverlay.init() 一次；每帧末尾（nvgEndFrame 前）调 ThemeOverlay.draw(vg)
-- 说明: 玩法零改动——只是"最后画一层"，强度可在 config/ThemeConfig.lua 调参
-- ============================================================================

local ThemeConfig = require("config.ThemeConfig")
local GameConfig  = require("config.GameConfig")

local ThemeOverlay = {}

local active_ = false

--- 初始化（Client.Start 调用一次）
function ThemeOverlay.init()
    active_ = (_G.LOCAL_MODE == true) and (ThemeConfig.DARK_THEME == true)
    if active_ then
        print("[ThemeOverlay] dark theme enabled (tone=" .. tostring(ThemeConfig.TONE_ALPHA)
            .. " vignette=" .. tostring(ThemeConfig.VIGNETTE_ALPHA) .. ")")
    end
end

function ThemeOverlay.isActive()
    return active_
end

--- 每帧末尾绘制（nvgEndFrame 之前；当前坐标系为设计分辨率空间）
function ThemeOverlay.draw(vg)
    if not active_ then return end

    local W = GameConfig.Design.WIDTH
    local H = GameConfig.Design.HEIGHT

    -- 1. 全局冷暗色调罩
    nvgBeginPath(vg)
    nvgRect(vg, 0, 0, W, H)
    nvgFillColor(vg, nvgRGBA(ThemeConfig.TONE_R, ThemeConfig.TONE_G, ThemeConfig.TONE_B, ThemeConfig.TONE_ALPHA))
    nvgFill(vg)

    -- 2. 径向暗角（中心透明 → 边缘暗紫黑）
    --    外圈半径必须 ≤ 屏幕对角距离（1080×2400 对角≈1316），否则角落收不到暗角
    local innerR = H * ThemeConfig.VIGNETTE_INNER
    local outerR = H * (ThemeConfig.VIGNETTE_INNER + 0.26)
    local paint = nvgRadialGradient(vg,
        W * 0.5, H * 0.5, innerR, outerR,
        nvgRGBA(0, 0, 0, 0),
        nvgRGBA(ThemeConfig.VIGNETTE_R, ThemeConfig.VIGNETTE_G, ThemeConfig.VIGNETTE_B, ThemeConfig.VIGNETTE_ALPHA))
    nvgBeginPath(vg)
    nvgRect(vg, 0, 0, W, H)
    nvgFillPaint(vg, paint)
    nvgFill(vg)
end

return ThemeOverlay
