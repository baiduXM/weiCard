## 更新日志

### 0.2.1

*2017-06-21*

- 项目目录重构 

  
```
graph LR

AdminFolder[AdminFolder后台]-->|extends继承|AdminController[AdminController控制器]
WebFolder[WebFolder网页端]-->|extends继承|HomeController[HomeController控制器]
MobileFolder[MobileFolder移动端]-->|extends继承|HomeController[HomeController控制器]

AdminController[AdminController控制器]-->|extends继承|CommonController[CommonController控制器]
HomeController[HomeController控制器]-->|extends继承|CommonController[CommonController控制器]

CommonController[CommonController控制器]-->|extends继承|Controller[Controller控制器]
 
```
    
```
graph LR
    
ModelsFolder[模型Folder]-->|extends继承|CommonModel[CommonModel模型]
CommonModel[CommonModel模型]-->|extends继承|Model[Model模型]
Model[Model模型]-->|implements实现|AuthenticatableContract[AuthenticatableContract合约]
Model[Model模型]-->|implements实现|AuthorizableContract[AuthorizableContract合约]
Model[Model模型]-->|implements实现|CanResetPasswordContract[CanResetPasswordContract合约]

```