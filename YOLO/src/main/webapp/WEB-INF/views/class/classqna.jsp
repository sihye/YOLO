<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
    .btn1{
    position: relative;
    display: block;
    float: right;
    text-align: center;
    line-height: 36px;
    margin-top: 12px;
    border-radius: 5px;
    cursor: pointer;
    width: 100px;
    height: 30px;
    color: #fff;
    background-color: #2196f3;
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
    font-family: NanumBarunGothic,'나눔바른고딕','Apple SD Gothic Neo',Helvetica,sans-serif,dotum,'돋움',arial;
    font-size: 14px;
    font-weight: 400;
    -webkit-font-smoothing: antialiased;
    text-shadow: rgba(0,0,0,.01) 0 0 1px;
    }
    .submitqna{
    	margin-top: 10px;
    	margin-bottom:10px;
    	text-align: right;
    }
    </style>
    <div class="title" style="text-align: center;">
    <h3 style="color:skyblue">궁금한 점이 있으신가요? 문의해 주시면 호스트가 답변을 해드립니다.</h3>
    </div>	
        <hr>
<div class="container">	
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        <div class="subtitle"><h4 style="color:skyblue">Q&A</h4></div>
        <textarea class="form-control" rows="3" placeholder="문의해 주시면 호스트가 답변을 해드립니다.(200자이내)"></textarea>
        <div class="submitqna">
        	<label style="margin-top: 5px;margin-right: 20px;"><input type="checkbox" id="secret" name="secret"> 비밀글   </label>
        	<button type="button" class="btn1">문의하기</button>
        </div> 
        <hr>
        <textarea class="form-control" rows="3" disabled style="resize:none;"></textarea>
        <i class="fa fa-quora"></i>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>