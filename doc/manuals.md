# 说明书

### 项目框架

- [laravel](http://laravelacademy.org/laravel-docs-5_2)       v5.2.45
- [jquery](http://hemin.cn/jq/index.html)        v1.11.3
- [bootstrap](http://v3.bootcss.com/css/)     v3.3.7
- [zui](http://zui.sexy/)           v1.6.0
- [mzui](http://zui.sexy/m/index.html)          v1.0.0

### 功能说明

#### 公司员工导入导出
- 公司员工导入excel文件，格式（xls,xlsx,cvs）
    - 第一列写标题，（工号、姓名、邮箱、电话、座机）目前可录入5个字段，多余字段不录入。顺序可变，名字不可变。
    - 不符合规则或员工人数超过上限的错误数据以原文件格式导出
    
- 公司员工导出xls格式文件    
    - 导出字段(工号，姓名，绑定码，绑定链接)
    - 文件名为公司名称+当前日期时间
    
    
