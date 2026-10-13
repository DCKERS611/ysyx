# 迁移时保留的旧文件

2026-10-13 迁移 WSL 文件时，发现两个文件的原名称都是反斜杠，无法直接用 Windows 文件名保存。这里改名保留原内容：

- `exp7-old-constraint.txt`：早期 PS/2 接收器的约束草稿，端口不对应当前键盘顶层。
- `light-reg-draft.txt`：流水灯草稿，含 `REST_VAL` 拼写错误；正确实现见 `equiv_light/light_reg.v`。

这些文件仅保留记录，不参与当前构建。
