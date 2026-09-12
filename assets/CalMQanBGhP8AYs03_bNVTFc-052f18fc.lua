-- ============================================================================
-- ThemeConfig - 暗黑画风主题配置（LOCAL_MODE 单机版专用）
-- 玩法零改动，仅全局视觉氛围：冷暗色调 + 暗角 + 背景压暗
-- ============================================================================

local ThemeConfig = {}

--- 暗黑主题总开关（仅 _G.LOCAL_MODE 时生效，联机模式永不受影响）
ThemeConfig.DARK_THEME = true

--- 全局色调叠加强度 0~255（深蓝黑罩，越暗调越冷）
ThemeConfig.TONE_ALPHA = 68

--- 暗角强度 0~255（边缘压暗）
ThemeConfig.VIGNETTE_ALPHA = 175

--- 暗角内圈起始半径（占屏高比例，越小暗角越大）
ThemeConfig.VIGNETTE_INNER = 0.30

--- 暗角色调（深紫黑，暗黑系经典边缘色）
ThemeConfig.VIGNETTE_R = 8
ThemeConfig.VIGNETTE_G = 4
ThemeConfig.VIGNETTE_B = 10

--- 全局色调色（深蓝黑）
ThemeConfig.TONE_R = 10
ThemeConfig.TONE_G = 9
ThemeConfig.TONE_B = 18

--- 基础清屏色（原 25,25,35 → 更深的冷黑）
ThemeConfig.CLEAR_R = 12
ThemeConfig.CLEAR_G = 10
ThemeConfig.CLEAR_B = 18

return ThemeConfig
