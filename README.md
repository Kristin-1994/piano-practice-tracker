# Joanna 的练琴打卡

手机和电脑可通过 Supabase 共用练习记录。未登录时，记录仍保存在当前设备。

## 启用多设备同步

1. 在 Supabase 创建一个免费项目。
2. 在项目的 SQL Editor 运行本仓库的 `supabase-setup.sql`。
3. 在 Project Settings → API 中复制 Project URL 和 anon / publishable key。
4. 打开练琴打卡网页，在“多设备同步”区域填入 URL、key、邮箱和密码，点击“登录 / 注册”。同一个邮箱账号用于所有设备。
5. 首次登录会将当前设备的旧记录合并到云端；其他设备登录后即可读取。网页会定时同步新增记录。

如果注册后提示确认邮件，请先点击邮件中的确认链接，再回网页登录。邮箱确认设置可在 Supabase Authentication → Providers → Email 中调整。

同步凭据和登录会话保存在浏览器本地。数据库启用了行级安全策略，每个账号只能访问自己的记录。请勿把 `service_role` 密钥填入网页，只使用 anon / publishable key。

云端配置完成并发布更新后的网页后，手机和电脑都打开同一网址、登录同一账号即可同步。未登录时仍可照常本机使用。
