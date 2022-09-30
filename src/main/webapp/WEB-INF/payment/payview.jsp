<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<!-- bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style type="text/css">
	.deco-list li img{
		width: 100%;
		box-sizing: border-box;
	}
	
	.sample img {
    width: 100%;
	}
	
    div.paymain{
        letter-spacing: -0.5px;
        line-height: 1.6;
        color: #666;
        word-wrap: break-word;
        word-break: break-all;
        font-family: '돋움','Helvetica','Tahoma',dotum,sans-serif,'Malgun Gothic';
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
     }
     div.new-order{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        padding-bottom: 140px;
        color: #222;
        font-size: 16px;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
     }
     div.subcontents{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        position: relative;
        width: 1040px;
        margin: 0 auto;
        color: #222;
     }
     h1{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        color: #222;
        margin: 80px 0;
        text-align: center;
        font-size: 36px;
        font-weight: bold;
     }
     h2{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        color: #222;
        margin: 80px 0 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #222;
        font-size: 26px;
        font-weight: bold;
     }
     div.col-type01{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        display: flex;
        justify-content: space-between;
     }
     div.theme_all{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        width: 688px;
        box-sizing: border-box;
     }
     div.theme_all>.theme{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
     }
     div.head-tab{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        position: relative;
     }
     div.head-tab>h3{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        color: #222;
        margin-bottom: 20px;
        font-size: 20px;
        font-weight: bold;
        display: inline-block;
     }
     div.head-tab>ul{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        list-style: none;
        color: #222;
        position: absolute;
        top: 0;
        right: 0;
     }
     div.head-tab>ul>li{
        letter-spacing: -0.5px;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        list-style: none;
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        line-height: 100%;
        color: #222;
        float: left;
        margin-left: 9px;
     }
     div.head-tab>ul>li>a{
        letter-spacing: -0.5px;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        list-style: none;
        font-size: 100%;
        text-decoration: none;
        cursor: pointer;
        color: #222;
        display: block;
        padding: 6px 12px 4px;
        font-weight: bold;
        border-radius: 16px;
        line-height: 22px;
     }
     div.row-type01{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        margin-bottom: 40px;
     }
     div.tabArea{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        display: none;
     }
     div.col-type02{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        display: flex;
        justify-content: space-between;
     }
     div.banner_choice{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        width: 421px;
        box-sizing: border-box;
     }
     div.banner_choice>h4{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        color: #222;
        margin-bottom: 15px;
        font-size: 16px;
        font-weight: bold;
     }
     div.banner_choice>.scrollBox{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        overflow-y: scroll;
        border: 1px solid #ececec;
        color: #222;
        height: 253px;
     }
     div.banner_choice>.scrollBox>.deco-list{
        letter-spacing: -0.5px;
	    line-height: 1.6;
	    word-wrap: break-word;
	    word-break: break-all;
	    font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
	    margin: 0;
	    padding: 0;
	    border: 0;
	    outline: 0;
	    font-size: 100%;
	    background: transparent;
	    overflow: hidden;
	    width: 100%;
	    color: #222;
     }
     div.banner_choice>.scrollBox>.deco-list>ul{
	 	letter-spacing: -0.5px;
	    line-height: 1.6;
	    word-wrap: break-word;
	    word-break: break-all;
	    font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
	    border: 0;
	    outline: 0;
	    font-size: 100%;
	    background: transparent;
	    list-style: none;
	    color: #222;
	    margin: 0;
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 12px;
	    padding: 12px;
     }
     div.banner_choice>.scrollBox>.deco-list>ul>li{
            letter-spacing: -0.5px;
		    word-wrap: break-word;
		    word-break: break-all;
		    font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
		    list-style: none;
		    padding: 0;
		    border: 0;
		    outline: 0;
		    font-size: 100%;
		    background: transparent;
		    line-height: 100%;
		    color: #222;
		    float: left;
		    position: relative;
		    box-sizing: border-box;
		    width: 100%;
		    margin: 0;
     }
     div.banner_choice>.scrollBox>.deco-list>ul>img{
         	letter-spacing: -0.5px;
		    word-wrap: break-word;
		    word-break: break-all;
		    font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
		    list-style: none;
		    line-height: 100%;
		    margin: 0;
		    padding: 0;
		    outline: 0;
		    font-size: 100%;
		    background: transparent;
		    vertical-align: middle;
		    color: #222;
		    width: 100%;
		    box-sizing: border-box;
		    border: none;
     }
        .deco-list .btnSel {
            letter-spacing: -0.5px;
		    word-wrap: break-word;
		    word-break: break-all;
		    font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
		    list-style: none;
		    font-size: 100%;
		    line-height: 100%;
		    text-decoration: none;
		    cursor: pointer;
		    color: #222;
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
        }
        .a11y-hidden {
            overflow: hidden;
            position: absolute;
            clip: rect(0 0 0 0);
            clip: rect(0,0,0,0);
            width: 1px;
            height: 1px;
            margin: -1px;
            border: 0;
            padding: 0;
        }
        .new-order h4 {
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .card_choice {
            width: 241px;
            box-sizing: border-box;
        }
        .card_choice>.scrollBox{
            letter-spacing: -0.5px;
            line-height: 1.6;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            margin: 0;
            padding: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            overflow-y: scroll;
            border: 1px solid #ececec;
            color: #222;
            height: 253px;
        }
        .card_choice>.scrollBox>.deco-list{
            letter-spacing: -0.5px;
            line-height: 1.6;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            overflow: hidden;
            width: 100%;
            color: #222;
        }
        .card_choice>.scrollBox>.deco-list>ul{
            letter-spacing: -0.5px;
            line-height: 1.6;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            border: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            list-style: none;
            color: #222;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            padding: 12px;
        }
        .card_choice>.scrollBox>.deco-list>ul>li{
            letter-spacing: -0.5px;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            list-style: none;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            line-height: 100%;
            color: #222;
            float: left;
            position: relative;
            box-sizing: border-box;
            width: 100%;
            margin: 0;
        }
        .card_choice>.scrollBox>.deco-list>ul>li>img{
            letter-spacing: -0.5px;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            list-style: none;
            line-height: 100%;
            margin: 0;
            padding: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            vertical-align: middle;
            color: #222;
            width: 100%;
            box-sizing: border-box;
            border: none;
        }
        .card_choice>.scrollBox>.deco-list>ul>li>a{
            letter-spacing: -0.5px;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            list-style: none;
            font-size: 100%;
            line-height: 100%;
            text-decoration: none;
            cursor: pointer;
            color: #222;
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        .a11y-hidden {
            overflow: hidden;
            position: absolute;
            clip: rect(0 0 0 0);
            clip: rect(0,0,0,0);
            width: 1px;
            height: 1px;
            margin: -1px;
            border: 0;
            padding: 0;
        }

        .head-tab{
            letter-spacing: -0.5px;
            line-height: 1.6;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            background: transparent;
            color: #222;
            position: relative;
        }
        .head-tab>h3{
            letter-spacing: -0.5px;
            line-height: 1.6;
            word-wrap: break-word;
            word-break: break-all;
            font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            background: transparent;
            color: #222;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
            display: inline-block;
        }
       .head-tab>ul{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        list-style: none;
        color: #222;
        position: absolute;
        top: 0;
        right: 0;
       }
       .head-tab>ul>li{
        letter-spacing: -0.5px;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        list-style: none;
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        line-height: 100%;
        color: #222;
        float: left;
        margin-left: 9px;
       }
       .msg-area{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
       }
       .msg-area>#mms_send_msg{
        word-break: break-all;
        overflow-y: auto;
        text-align: left;
        border: 1px solid #cfcfcf;
        resize: none;
        line-height: 1.5;
        color: #222;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        width: 100%;
        height: 120px;
        padding: 20px;
        box-sizing: border-box;
        outline: none;
        border-color: #eeeeee;
        font-size: 16px;
       }
       .sample{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        color: #222;
        padding: 20px 8px 8px;
        background: #222;
        border-radius: 12px;
        width: 300px;
        box-sizing: border-box;
       }
       .sample>.inner{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        display: block;
        color: #222;
        overflow-y: auto;
        max-height: 565px;
        padding: 20px;
        background: #f6f6f6;
        border-radius: 4px;
       }
       .sample>.inner>.imgBox{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        color: #222;
        margin-bottom: 20px;
        background: #fff;
       }
       .imgBox>.topImg{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
       }
       .imgBox>.topImg>img{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        border: 0;
        vertical-align: middle;
        color: #222;
        width: 100%;
       }

       .imgBox>.pin{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        padding: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        margin: 5px;
        border: 1px solid #eeeeee;
       }
       .imgBox>.pin>.col-half{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
       }
       .col-half>.giftImg{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        float: left;
        width: 50%;
       }
       .col-half>.cardImg{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
        float: left;
        width: 50%;
       }
       .bacord{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        color: #222;
       }
       .bacord>img{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        outline: 0;
        font-size: 100%;
        background: transparent;
        border: 0;
        vertical-align: middle;
        color: #222;
        width: 100%;
       }
       #msg_sample{
        letter-spacing: -0.5px;
        line-height: 1.6;
        word-wrap: break-word;
        word-break: break-all;
        font-family: "Spoqa Han Sans Neo", "Apple SD Gothic Neo", "Malgun Gothic", "sans-serif";
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        background: transparent;
        color: #222;
        min-height: 173px;
        white-space: pre-wrap;
        font-size: 12px;
       }
</style>
</head>
<script type="text/javascript">
	$(function() {
		$(document).on("click",".message",function() {
	 		var message = $(this).attr("value");
	 		$("#mms_send_msg").val(message);
	 		
	 	 	$("#msg_sample").text(message);
		});
	/* 	$(".message").click(function() {
	 		var message = $(this).attr("value");
	 		$("#mms_send_msg").text(message);
	 	 	$("#msg_sample").text(message);
		}); */
		
		$(".bannerImg").click(function () {
			var banner = $(this).attr("src");
			
			$("img#previewBanner").attr("src",banner);
		});
		
		$(".cardImg").click(function () {
			var card = $(this).attr("src");
			
			$("img#previewTemplate").attr("src",card);
		});
		
	 	$(document).ready(function(){
            $("#mms_send_msg").on('keyup keypress',function(){
				
            	$("#msg_sample").text($(this).val());
            });
        });
	 	
	 
	});
</script>
<body>
 <div class="paymain">
        <div class="new-order">
            <div class="subcontents">
                <h1>선물 발송·결제</h1>
                <h2>선물 꾸미기</h2>
                <div class="justify-cont col-type01">
                    <!-- 테마와 배너 선택 -->
                    <div class="theme_all">

                        <div class="theme">

                            <!-- 테마 선택-->
                        <!--     <div class="head-tab">
                                <h3>테마</h3>
                                <ul class="tab-type01 _tab">
                                    <li><a href="#1-1" class="on">감사</a></li>
                                    <li><a href="#1-2" class="on">축하</a></li>
                                    <li><a href="#1-3" class="on">응원</a></li>
                                    <li><a href="#1-4" class="on">시즈널</a></li>
                                    <li><a href="#1-5" class="on">결혼</a></li>
                                    <li><a href="#1-6" class="on">조문</a></li>
                                </ul>
                            </div> -->
                            <!-- 테마 선택 끝-->
                            
                           <!--  <hr class="line"> -->

                            <!-- 배너-->
                            <div class="row-type01">

                                <!-- 배너영역 id t1~ -->
                                <div class="tabArea" id="t1-1" style="display: block;">
                                <div class="justify-cont col-type02">

                                    <!-- 배너 선택 -->
                                        <div class="banner_choice">
                                            <h4>배너</h4>
                                            <div class="scrollBox">
                                                <div class="deco-list">
                                                    <ul class="banner-div">
                                                        <li><img src="/jogong/resources/giftimage/banner/1.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/2.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/3.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/4.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/5.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/6.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/7.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/8.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/9.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/10.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/11.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/12.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/13.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/14.jpg" alt="배너이미지" class="bannerImg">
                                                        <li><img src="/jogong/resources/giftimage/banner/15.jpg" alt="배너이미지" class="bannerImg">
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- 배너 선택 종료--> 

                                    <!-- 카드 선택-->
                                        <div class="card_choice">
                                            <h4>카드</h4>
                                            <div class="scrollBox">
                                                <div class="deco-list">
                                                    <ul class="card-div">
                                                        <li><img src="/jogong/resources/giftimage/card/a1.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a2.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a3.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a4.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a5.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a6.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a7.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a8.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a9.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a10.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a11.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a12.jpg" alt="카드 이미지" class="cardImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a13.jpg" alt="카드 이미지" class="cardImg"></li>
                                                      
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- 카드 선택 종료 -->

                                </div>
                                </div>

                                <!-- 배너영역 id t1~ 끝-->
                            </div>
                            <!--배너-->
                            
                        </div>

                        <!-- 메세지 영역-->
                        <div class="head-tab">
                        <h3>메세지</h3>
                        <ul class="tab-tabtype01 _tab02" id="msg_cate">
                            <li>
                                <a href="#none" id="m-18" class="message" value="선물이 도착했어요~">기본</a>
                            </li>
                            <li>
                                <a href="#none" id="m-19" class="message" value="결혼 축하해~ 이제 지옥길만 남았구나">결혼</a>
                            </li>
                            <li>
                                <a href="#none" id="m-20" class="message" value="생일축하드립니다! 행복하세요">생일</a>
                            </li>
                            <li>
                                <a href="#none" id="m-21" class="message" value="명국짱에게 무한한 감사를!!">감사</a>
                            </li>
                            <li>
                                <a href="#none" id="m-22" class="message"value="찾아와주셔서 감사합니다 좋은 하루 되세요">조문</a>
                            </li>
                            <li>
                                <a href="#none" id="m-23" class="message" value="무야호~ 당첨되었구먼~~">당첨</a>
                            </li>
                        </ul>
                        </div>
                        <div class="msg-area">
                            <input type="text" id="mms_send_msg">
                        </div> 
                        <!-- 메세지 영역 끝--> 
                        
                    </div>
                    <!-- 테마와 배너 선택 끝 -->

                    <!-- 샘플이미지-->
                    <div class="sample">
                        <div class="inner">
                            <div class="imgBox">
                                <span class="topImg">
                                    <img id="previewBanner" src="/jogong/resources/giftimage/banner/1.jpg" alt="꾸미기배너">
                                </span>
                                <div class="pin">
                                    <div class="col-half">
                                        <div class="giftImg">
                                            <img src="/jogong/resources/image/21.jpeg" alt="카드 이미지">
                                        </div>
                                        <div class="cardImg">
                                            <img id="previewTemplate" src="/jogong/resources/giftimage/card/a1.jpg" alt="꾸미기 템플릿">
                                        </div>
                                    </div>
                                    <div class="bacord">
                                        <img src="/jogong/resources/image/decobanner04.gif" alt="바코드">
                                    </div>
                                </div>
                            </div>

                            <!--텍스트 박스-->
                            <p id="msg_sample"></p>

                        </div>
                    </div>
                    <!-- 샘플이미지 끝-->
                </div>
            </div>
        </div>
    </div>







































<hr>
	<div>
		<h2>IAMPORT 결제</h2>
		<li>
			<button id="iamportPayment" type="button">카카오페이 결제</button>
		</li>
		<li>
			<button id="iamportPayment2" type="button">휴대폰 결제</button>
		</li> 
		<li>
			<button id="iamportPayment3" type="button">KG이니시스</button>
		</li>
		<li>
			<button id="iamportPayment4" type="button">토스</button>
		</li>
	</div>

	<script type="text/javascript">
$(document).ready(function(){ 
 	 $("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
	$("#iamportPayment2").click(function(){ 
		danal();
    }); 
	$("#iamportPayment3").click(function(){ 
		kg();
    });
	$("#iamportPayment4").click(function(){ 
		toss();
    }); 
})
 //버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: "0034", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "음식", //결제창에 노출될 상품명
        amount: 100, //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
        	   alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method
                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}

function danal(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'nice',
	    pay_method : 'phone',
	    merchant_uid: "0034", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 1000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
        	 alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method
                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}


function kg(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "0034", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
        	 alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method
                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}
 
function toss(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'tosspay',
	    pay_method : 'card',
	    merchant_uid: "0034", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
}, function (rsp) { // callback
      if (rsp.success) {
    	  
    	  alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
          
          jQuery.ajax({
              url: "test.action",
              method: "POST",
			dataType:"json",
              data: {
                  "imp_uid": rsp.imp_uid,
                  "merchant_uid": rsp.merchant_uid,
                  "name" : rsp.name,
                  "amount" : rsp.paid_amount,
                  "buyer_name" : rsp.buyer_name,
                  "pg" : rsp.pg_provider,
                  "pay_method" : rsp.pay_method
              	}
              });
       } else {
    	   alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
           var msg = "결제에 실패했습니다"
           msg = "에러내용:" + rsp.error_msg;
           
           alert(msg);
       }
   });
}
</script>
</body>
</html>