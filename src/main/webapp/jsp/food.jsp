<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>买方-定向采购-发布LNG空车定向采购</title>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="tinymce.min.js"></script>
</head>
<body>
<style>
.mainMin {
    width: 1000px;
    margin: 0 auto;
    position: relative;
}
.forminfo {
    margin: 0 auto;
    width: 800px;
    height: 30px;
    border: 1px solid #F00;
}
.lngfont{
    float: left;
    size: +2;
    font-weight: bold;
    }
.formstyle{
    margin: 0 auto;
    width: 600px;
    height: 700px;
    border: 1px solid #F00;
    }
.form{
    padding: 20px 0 60px 30px;
    }
.font{
    
    }
.divstyle{
    padding-top:20px;
    }
.form .text{
    width: 300px;
    height: 15px;
    padding: 8px 10px;
    border: 1px solid #c1c1c1;
    line-height: 18px;
    font-size: 12px;
    color: #4d4d4d;
    vertical-align: middle;
    outline: none;
    font-family: "微软雅黑";
}

dl{
    position: relative;
    padding: 10px 40px;
}

dt {
    float: left;
    display:inline;
    width: 120px;
    line-height: 34px;
    color: #333;
    text-align: right;
}
dd {
    float:left;
    display:inline;
    line-height: 26px;
    margin-left:20px;
}
dl{clear:left;}

</style>
<div class="forminfo"> <font class="lngfont">发布罐车需求</font> </div>
<div class="formstyle">
  <div class="form">
    <form id=lngbuyform action="#" method="post">
    <dl class="divstyle">
      <dt> <font class="font">标题:</font></dt>
      <dd>
        <input class="text" id="title" name="title" tabindex="3" type="text" placeholder="请填写标题">
      </dd>
    </dl>
    <dl class="divstyle">
    <dt> <font class="font">空车日期:</font></dt>
    <dd>
      <input class="text" id="title" name="title" tabindex="3" type="text" placeholder="点击选择日期">
    </dd>
    </dl>
    <dl class="divstyle">
      <dd>
        <label><font class="font">空车地址:</font></label>
        <select name="choose" id="choose">
          <option value="province" selected="selected">省份</option>
          <option value="zhengjiang">浙江省</option>
          <option value="yunnang">云南省</option>
          <option value="henang">河南省</option>
        </select>
      </dd>
      <dd>
        <select name="choose" id="choose">
          <option value="city" selected="selected">地级市</option>
          <option value="yiwu ">义乌</option>
          <option value="shanghai">上海</option>
          <option value="河南">河南</option>
        </select>
      </dd>
    </dl>
    <dl class="divstyle">
      <dd>
        <input class="text" id="address" name="address" tabindex="3" type="text" placeholder="请填写地址">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt> <font class="font">载货量：</font></dt>
      <dd>
        <input class="text" id="goodsburden" name="goodsburden" tabindex="3" type="text" placeholder="载货量">
        <font class="font"> 吨</font></dd>
    </dl>
    <dl class="divstyle">
      <dt>
        <label><font class="font">空车类型:</font></label>
      </dt>
      &nbsp;
      <dd>
        <input name="alreadytruck" type="checkbox" value="待装车" />
        &nbsp;<font class="font">待装车</font></dd>
      &nbsp;&nbsp;
      <dd>
        <input name="nottruck" type="checkbox" value="返空" />
        <font class="font">返空</font></dd>
    </dl>
    <dl class="divstyle">
      <dt>
        <label><font class="font">配送区域:</font></label>
      </dt>
      &nbsp;
      <dd>
        <input name="country" type="checkbox" value="全国" />
        &nbsp;<font class="font">全国</font></dd>
      &nbsp;&nbsp;
      <dd>
        <input name="direction" type="checkbox" value="填写指定区域" />
        <font class="font">填写指定区域</font> </dd>
    </dl>
    <dl class="divstyle">
      <dt> <font class="font">联系人：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写指定区域">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">公司名称：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写公司名称">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">联系电话：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写联系电话">
      </dd>
    </dl>
    <dl class="divstyle">
    <dt> <font class="font">LNG罐车图片：</font></dt>
    <dd>
    <form name="test_form" method="post" ENCTYPE="multipart/form-data" onsubmit="alert(document.test_form.browse.value);" />
    
    <input type="file" name="browse" style="display:none;width:252px;" />
    <a href="javascript:fn_browse();"> <br/>
    <img name="btn" width=50 height=20 src="#" border="0"/> </a> <br/>
    </form>
    </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">LNG罐车描述</font></dt>
      <dd>
        <textarea id="txtcontent" runat="server" name="elm1″ rows="15″ cols="80″ style="width:80%"></textarea>
      </dd>
    </dl>
    <dl class="button">
      <dd>
        <input type="button" value="取消" class="cancel" onclick="cancel()" />
        &nbsp;&nbsp;&nbsp;
        <input type="button"  class="publish" value="发布" onclick="publish()"/>
      </dd>
    </dl>
    </form>
  </div>
</div>
</body>
</html><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>买方-定向采购-发布LNG空车定向采购</title>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="tinymce.min.js"></script>
</head>
<body>
<style>
.mainMin {
    width: 1000px;
    margin: 0 auto;
    position: relative;
}
.forminfo {
    margin: 0 auto;
    width: 800px;
    height: 30px;
    border: 1px solid #F00;
}
.lngfont{
    float: left;
    size: +2;
    font-weight: bold;
    }
.formstyle{
    margin: 0 auto;
    width: 600px;
    height: 700px;
    border: 1px solid #F00;
    }
.form{
    padding: 20px 0 60px 30px;
    }
.font{
    
    }
.divstyle{
    padding-top:20px;
    }
.form .text{
    width: 300px;
    height: 15px;
    padding: 8px 10px;
    border: 1px solid #c1c1c1;
    line-height: 18px;
    font-size: 12px;
    color: #4d4d4d;
    vertical-align: middle;
    outline: none;
    font-family: "微软雅黑";
}

dl{
    position: relative;
    padding: 10px 40px;
}

dt {
    float: left;
    display:inline;
    width: 120px;
    line-height: 34px;
    color: #333;
    text-align: right;
}
dd {
    float:left;
    display:inline;
    line-height: 26px;
    margin-left:20px;
}
dl{clear:left;}

</style>
<div class="forminfo"> <font class="lngfont">发布罐车需求</font> </div>
<div class="formstyle">
  <div class="form">
    <form id=lngbuyform action="#" method="post">
    <dl class="divstyle">
      <dt> <font class="font">标题:</font></dt>
      <dd>
        <input class="text" id="title" name="title" tabindex="3" type="text" placeholder="请填写标题">
      </dd>
    </dl>
    <dl class="divstyle">
    <dt> <font class="font">空车日期:</font></dt>
    <dd>
      <input class="text" id="title" name="title" tabindex="3" type="text" placeholder="点击选择日期">
    </dd>
    </dl>
    <dl class="divstyle">
      <dd>
        <label><font class="font">空车地址:</font></label>
        <select name="choose" id="choose">
          <option value="province" selected="selected">省份</option>
          <option value="zhengjiang">浙江省</option>
          <option value="yunnang">云南省</option>
          <option value="henang">河南省</option>
        </select>
      </dd>
      <dd>
        <select name="choose" id="choose">
          <option value="city" selected="selected">地级市</option>
          <option value="yiwu ">义乌</option>
          <option value="shanghai">上海</option>
          <option value="河南">河南</option>
        </select>
      </dd>
    </dl>
    <dl class="divstyle">
      <dd>
        <input class="text" id="address" name="address" tabindex="3" type="text" placeholder="请填写地址">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt> <font class="font">载货量：</font></dt>
      <dd>
        <input class="text" id="goodsburden" name="goodsburden" tabindex="3" type="text" placeholder="载货量">
        <font class="font"> 吨</font></dd>
    </dl>
    <dl class="divstyle">
      <dt>
        <label><font class="font">空车类型:</font></label>
      </dt>
      &nbsp;
      <dd>
        <input name="alreadytruck" type="checkbox" value="待装车" />
        &nbsp;<font class="font">待装车</font></dd>
      &nbsp;&nbsp;
      <dd>
        <input name="nottruck" type="checkbox" value="返空" />
        <font class="font">返空</font></dd>
    </dl>
    <dl class="divstyle">
      <dt>
        <label><font class="font">配送区域:</font></label>
      </dt>
      &nbsp;
      <dd>
        <input name="country" type="checkbox" value="全国" />
        &nbsp;<font class="font">全国</font></dd>
      &nbsp;&nbsp;
      <dd>
        <input name="direction" type="checkbox" value="填写指定区域" />
        <font class="font">填写指定区域</font> </dd>
    </dl>
    <dl class="divstyle">
      <dt> <font class="font">联系人：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写指定区域">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">公司名称：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写公司名称">
      </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">联系电话：</font></dt>
      <dd>
        <input class="text" id="name" name="name" tabindex="3" type="text" placeholder="请填写联系电话">
      </dd>
    </dl>
    <dl class="divstyle">
    <dt> <font class="font">LNG罐车图片：</font></dt>
    <dd>
    <form name="test_form" method="post" ENCTYPE="multipart/form-data" onsubmit="alert(document.test_form.browse.value);" />
    
    <input type="file" name="browse" style="display:none;width:252px;" />
    <a href="javascript:fn_browse();"> <br/>
    <img name="btn" width=50 height=20 src="#" border="0"/> </a> <br/>
    </form>
    </dd>
    </dl>
    <dl class="divstyle">
      <dt><font class="font">LNG罐车描述</font></dt>
      <dd>
        <textarea id="txtcontent" runat="server" name="elm1″ rows="15″ cols="80″ style="width:80%"></textarea>
      </dd>
    </dl>
    <dl class="button">
      <dd>
        <input type="button" value="取消" class="cancel" onclick="cancel()" />
        &nbsp;&nbsp;&nbsp;
        <input type="button"  class="publish" value="发布" onclick="publish()"/>
      </dd>
    </dl>
    </form>
  </div>
</div>
</body>
</html>