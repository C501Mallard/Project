<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Home.aspx.cs" Inherits="User_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #container {
            border: 2px solid;
            width: 500px;
            position: relative;
        }

        #menu {
            border: 2px solid #1b6f39;
            position: absolute;
            top: 0;
            left: 0;
            height: 50px;
        }

        #menu, .submenu {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            #menu li {
                background-color: #0094ff;
                float: left;
                border-right: 1px solid white;
            }

            #menu a {
                color: white;
                text-decoration: none;
                padding: 10px;
                width: 120px;
                display: block;
            }

            #menu li ul {
                width: 120px;
            }

            #menu a:hover {
                background-color: #4800ff;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <div id="container">
        <ul id="menu">
            <li>
                <a href="#">產品</a>
                <ul class="submenu">
                    <li><a href="#">ASP.net</a></li>
                    <li><a href="#">jQuery</a></li>
                    <li><a href="#">JavaScript</a></li>
                </ul>
            </li>
            <li>
                <a href="#">服務</a>
                <ul class="submenu">
                    <li><a href="#">線上客服</a></li>
                    <li><a href="#">檔案下載</a></li>
                    <li><a href="#">資料查詢</a></li>
                </ul>
            </li>
            <li>
                <a href="#">查詢</a>
                <ul class="submenu">
                    <li><a href="#">訂單查詢</a></li>
                    <li><a href="#">歷史訂單</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script>
        $('.submenu').hide();
        $('#menu li').hover(function () {
            $(this).find('ul').slideDown(300);
        }, function () {
            $(this).find('ul').slideUp(300);
        });
    </script>

    </form>
</body>
</html>
