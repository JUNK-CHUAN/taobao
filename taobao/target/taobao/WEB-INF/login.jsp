<%--
  Created by IntelliJ IDEA.
  User: junk_chuan
  Date: 2020/6/16
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /* 清除边框 */
        * {
            margin: 0;
            padding: 0;
        }
        /* 更改默认值 */
        html, body {
            width: 100%;
            height: 100%;
        }
        /* 添加背景图片 */
        .main {
            width: 100%;
            height: 100%;
            background: url("/source/img/loginbkg.jpg") 100% 100% no-repeat;
        }
        /* 调整输入框位置 */
        .loginFrame {
            width: 800px;
            height: 400px;
            background: rgba(0, 0, 0, 0.3);
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            border-radius: 10px;
            /*添加边距*/
            padding: 50px 0;
            box-sizing: border-box;
            /*添加阴影*/
            box-shadow: 0 0 5px 5px rgba(0, 0, 0, 0.4);
        }
        /* 改变输入框位置 */
        .loginFrame > div {
            width: 350px;
            height: 50px;
            margin: 40px auto;
            /*更改字体颜色*/
            color: white;
        }
        /* 改变标题居中 */
        .loginFrame > p{
            text-align: center;
            color: white;
            font-size: 25px;
        }
        /* 改变输入框文字 */
        .loginFrame > div > span {
            display: inline-block;
            cursor: pointer;
        }
        /* 改变输入框样式 */
        .loginFrame > div input {
            width: 100%;
            height: 30px;
            /*透明色*/
            background: transparent;
            border: none;
            border-bottom: 1px solid white;
            /* 清除蓝色点击框 */
            outline: none;
            color: white;
        }
        /* 改变登录按钮 */
        .loginFrame .enterBtn {
            width: 200px;
            height: 50px;
            border-radius: 50px;
            /* 设置背景颜色 渐变 */
            background-image: linear-gradient(to right, #c979d4, #fa719d);
            text-align: center;
            padding-top: 10px;
            box-sizing: border-box;
            font-size: 20px;
            cursor: pointer;
        }
        .loginFrame .enterBtn:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5) inset;
        }
        /* 改变输入框提示字体颜色 */
        input::placeholder {
            color: #bdcada;
        }
        svg {
            vertical-align: bottom;
        }
    </style>
</head>
<body>

<!-- 结构缩写 -->
<div class="main">
    <!-- 登录框 -->
    <div class="loginFrame">
        <!-- 标题 -->
        <p class="loginTitle">Login</p>
        <!-- 用户名 -->
        <div class="user">
            <label>
                    <span>
                        <svg t="1592234299139" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5146" width="20" height="20"><path d="M513 956.3c-247.7 0-448-200.3-448-448S265.3 66.2 513 66.2s448 200.3 448 448-200.3 442.1-448 442.1z m0-830.9c-212.2 0-388.8 170.7-388.8 388.8C124.2 726.3 294.9 903 513 903c212.2 0 388.8-170.7 388.8-388.8S725.2 125.4 513 125.4z m0 430.2c-94.2 0-170.7-76.5-170.7-170.7S418.8 207.8 513 207.8s170.7 76.5 170.7 170.7S607.2 555.6 513 555.6z m0-289.1c-64.6 0-112 52.8-112 112s47.4 117.9 112 117.9 112-52.8 112-112-47.4-117.9-112-117.9z m0 689.8c-135.7 0-259-58.7-341.9-158.9l-11.8-17.8 11.8-17.8c76.5-117.9 206.2-188.5 347.8-188.5 135.7 0 265 64.6 341.9 182.6l11.8 17.8-11.8 17.8C778 897.1 648.7 956.3 513 956.3zM230.3 773.2C300.9 849.7 406.9 897 513 897c112 0 218.1-47.4 288.6-129.8-70.5-88.2-170.7-135.6-282.7-135.6s-218.1 53.3-288.6 141.6z" p-id="5147" fill="#ffffff"></path></svg>
                    </span>
                <span>用户名</span>
                <!-- 输入框 -->
                <input type="text" placeholder="     username">
            </label>
        </div>
        <!-- 密码 -->
        <div class="password">
            <label>
                    <span>
                        <svg t="1592234235032" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4315" width="20" height="20"><path d="M989.25 455.38l-5.4-33.67h-63.69v-0.88A412.95 412.95 0 0 0 103.75 333a40 40 0 1 0 78.19 16.95C214.85 198.15 351.67 88 507.28 88c183.85 0 333.36 149.8 332.88 333.74h-801l-5.4 33.67a488.74 488.74 0 0 0-6.14 77.17 484 484 0 0 0 929.73 188.33 480.83 480.83 0 0 0 38-188.35 488.74 488.74 0 0 0-6.1-77.18zM512 936.41c-222.68 0-403.85-181.17-403.85-403.85 0-10.28 0.39-20.58 1.17-30.84h805.36c0.78 10.26 1.17 20.56 1.17 30.84 0 222.68-181.17 403.85-403.85 403.85z" fill="#ffffff" p-id="4316"></path><path d="M389.95 659.71a122.46 122.46 0 0 0 82.21 119.36v72.45c0 20.7 16.86 39.41 37.52 40.65a40 40 0 0 0 42.48-39.93v-73.17a122.27 122.27 0 0 0-42.08-237.8c-64.98 1.09-118.14 53.49-120.13 118.44zM512 705.8a42.27 42.27 0 1 1 42.27-42.27A42.32 42.32 0 0 1 512 705.8zM507.77 118.14a15 15 0 1 0 0 30A272.41 272.41 0 0 1 758.21 313a15 15 0 0 0 27.56-11.86 302.38 302.38 0 0 0-278-183z" fill="#ffffff" p-id="4317"></path><path d="M787.15 352.18m-15 0a15 15 0 1 0 30 0 15 15 0 1 0-30 0Z" fill="#ffffff" p-id="4318"></path></svg>
                    </span>
                <span>密码</span>
                <!-- 输入框 -->
                <input type="password" placeholder="     password">
            </label>
        </div>
        <!-- 登录按钮 -->
        <div class="enterBtn">
            <span>登录</span>
        </div>
    </div>
</div>

</body>
</html>
