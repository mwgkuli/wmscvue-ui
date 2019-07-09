import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams,ToastController } from 'ionic-angular';
import {HttpClient} from '@angular/common/http'
import { LoginPage } from '../login/login';

/**
 * Generated class for the RegPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-reg',
  templateUrl: 'reg.html',
})
export class RegPage {
  uname=""
  upwd=""
  phone=""
  email=""

  constructor(
    private toastCtrl:ToastController,
    private myHttp:HttpClient,
    public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad RegPage');
  }
  doReg(){
    var url="http://localhost:8000/user/register"
   // console.log(this.uname,this.upwd,this.phone,this.email)
    this.myHttp.post(
      url,
      {uname:this.uname,upwd:this.upwd,phone:this.phone,email:this.email},
      {withCredentials:true}
    ).subscribe((result:any)=>{
      //console.log(result)
      if(result.code==200){
        //添加成功，显示一个toast
        var myToast = this.toastCtrl.create({
          message:'添加成功',
          duration:500,
        });
        myToast.present();
        setTimeout(()=>{
          this.navCtrl.push(LoginPage)
        },2000)
        
      }
    })
  }
}
