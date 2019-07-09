var hgDiv = document.createElement("div");
    hgDiv.setAttribute('id', 'hg_top');
    hgDiv.innerHTML = '<style>.public_hg_top{background: #FFF; border-bottom: 1px solid #e2e2e2;  font-size: 12px;}.public_hg_main{width: 1200px; height: 51px; margin: 0 auto;}.public_hg_text{float: left; width:950px; padding: 6px 0 0 48px; color: #000; line-height: 20px; font-size: 14px;}.public_hg_text a{color: #000; text-decoration: underline;}.public_hg_text span{font-family: arial;}.public_hg_ok{float: right; width: 86px; padding-top: 10px;}.public_hg_ok a{display: block; width: 66px; height: 28px; line-height: 28px; text-align: center; background: #e8e8ea; border: 1px solid #e2e2e2; color:#666; border-radius: 4px; text-decoration: none;}.public_hg_ok a:hover{background: #f5f5f5; text-decoration: none;}</style><div class="public_hg_top" id="public_hg_top" style="display:none;"><div class="public_hg_main"><div class="public_hg_text">为向您提供良好的网站使用体验，完美世界网站会使用自身或第三方的<span>Cookie</span>，以作为安全、技术、分析、推广等之用。继续浏览本网站即表示您同意我们使用<span>Cookie</span>。若想了解更多，请阅读我们的<a href="http://static.wanmei.com/passport/agreement/cookie-policy.html" target="_blank"><span>Cookie</span>政策</a>。</div><div class="public_hg_ok"><a href="javascript:;"id="public_hg_btn2">知道了</a></div></div></div>';
    var hgwm = {
    	tag: function (name, elm) { var e = elm || document; return e.getElementsByTagName(name); }
    }
    var hgbody = hgwm.tag('body')[0];
    var hginst = hgwm.tag('body')[0].firstChild;
    hgbody.insertBefore(hgDiv, hginst)

    getIdName("public_hg_btn2").onclick = function(){
        searchCookieTop();
    };
    function getIdName(id){
        return document.getElementById(id);
    };
    function setCookieHg(c_name,value,expiredays){
        var exdate=new Date()
        exdate.setDate(exdate.getDate()+expiredays)
        document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString()) + ";path=/";
    };
    function getCookieHg(name){ 
        var strCookie=document.cookie;
        var arrCookie=strCookie.split("; "); 
        for(var i=0;i<arrCookie.length;i++){ 
            var arr=arrCookie[i].split("="); 
            if(arr[0]==name)return arr[1]; 
        } 
        return ""; 
    };
    function searchCookieTop(){
        if(getCookieHg("puclic_hg_flag2")){
            getIdName("public_hg_top").style.display="none"
        }else{
            getIdName("public_hg_top").style.display="block"
            setCookieHg("puclic_hg_flag2","true",365);
        }
    };
    searchCookieTop();