import { Component } from '@angular/core';
import { LoadingController,ViewController,IonicPage, NavController, NavParams } from 'ionic-angular';

/**
 * Generated class for the PayPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-pay',
  templateUrl: 'pay.html',
})
export class PayPage {

  constructor(
    private loadingCtrl:LoadingController,
    private viewCtrl:ViewController,
    public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad PayPage');
  }

  // 点击x，关闭模态窗口：借助于ViewController当中的dismiss方法来实现关闭效果
  closeModal(){
    this.viewCtrl.dismiss()
  }

  showLoading(){
    //显示loading，持续3s
    var myLoading = this.loadingCtrl.create({
      content:'正在支付...',
      duration:3000
    });
    myLoading.present()
    // 3s之后 关闭模态窗、
    setTimeout(()=>{
      this.viewCtrl.dismiss()
    },3000)
  }

}
