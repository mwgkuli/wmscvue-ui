import { Component } from '@angular/core';
import {ToastController, IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient} from '@angular/common/http'
import { NotFoundPage } from '../not-found/not-found';
import { CartPage } from '../cart/cart';
import { LoginPage } from '../login/login';


/**
 * Generated class for the DetailPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-detail',
  templateUrl: 'detail.html',
})
export class DetailPage {
  notFound = NotFoundPage
  cart = CartPage;
  picList = []
  title = ""
  subtitle=""
  price = 0

  constructor(
    private toastCtrl:ToastController,
    private myHttp:HttpClient,
    public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
   // console.log('ionViewDidLoad DetailPage');
    var myId = this.navParams.get('id')
    //console.log("详情页接收到id是"+myId)

    var url = "http://localhost:8000/product/detail?lid="+myId;

    this.myHttp.get(url,{withCredentials:true})
    .subscribe((result:any)=>{
      //console.log(result)
      // 将result.details.**属性保存起来 然后到视图中进行渲染

      //result.details.picList
      //result.details.title/subtitle/price
      this.picList = result.details.picList
      var list=[];
      list[0]= this.picList[0].md1
      list[1]= this.picList[0].md2 
      list[2]= this.picList[0].md3
      list[3]= this.picList[0].md4  
      //console.log(list)
      this.picList =list;
      //console.log(this.picList)
      this.title = result.details.title
      this.subtitle = result.details.subtitle
      this.price = result.details.price
    })
  }

  // 添加到购物车
  addToCart(){
    var myId = this.navParams.get('id')
    var url = "http://localhost:8000/cart/add?buyCount=1&lid="+myId;
    
    this.myHttp.get(url,{withCredentials:true}).subscribe((result:any)=>{
      console.log(result)
      if(result.code == 300){
        //未登录
        this.navCtrl.push(LoginPage)
      }else if(result.code == 200){
        //添加成功，显示一个toast
        var myToast = this.toastCtrl.create({
          message:'添加成功',
          duration:1500
        });
        myToast.present();
      }
    })
  }

}
