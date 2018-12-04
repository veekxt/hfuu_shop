## 使用原生Jsp和Servlet实现的简单二手物品交易网站

demo: [http://veekxt.com/hfuu_shop](http://veekxt.com/hfuu_shop)

测试用户：邮箱：`veekxt@gmail.com` 密码: `123456`

引用了`jquery`和`bootstrap`，已经包含在`WebContent/src/`中了

使用了eclipse默认的的文件结构, 测试和部署的简单方法是使用eclipse导出war文件, 其他ide自行更改文件结构。sql/hfuu_shop.sql包含了完整的数据库结构和测试数据。

功能实现:

- 商品发布
- 商品浏览、购买
- 购物车（批量购买）
- 消息系统
 - 自动消息通知（审核结果、商品变动）
 - 站内私信
- 个人中心
  - 管理员商品审核
  - 消息发送/接收
  - 购买历史
  - 发布历史
  - 收藏夹
  - 个人信息
- 物品搜索
- 物品、消息、收藏夹的分页
