import { Component } from '@angular/core';
import { ToastController,IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient} from '@angular/common/http'
import { RegPage } from '../reg/reg';
/**
 * Generated class for the LoginPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {
  reg=RegPage
  uname = ""
  upwd = ""
 

  constructor(
    private toastCtrl:ToastController,
    private myHttp:HttpClient,
    public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }
  doLogin(){
    //获取用户名和密码
    console.log(this.uname,this.upwd)
    // 发给服务器做校验
    var url = "http://localhost:8000/user/login"
    // 解析返回的结果 然后做处理
    this.myHttp.post(
      url,
      {uname:this.uname,upwd:this.upwd},
      {withCredentials:true}
    ).subscribe((result:any)=>{
      console.log(result)
      // 如果result.code是200 登录成功，返回上一页
      if(result.code == 200) {
        this.navCtrl.pop()
      }else{
        //Toast 登录失败
        var myToast = this.toastCtrl.create({
          message:"登录失败",
          duration:1500
        })
        myToast.present()
      }
    })
  }

}
