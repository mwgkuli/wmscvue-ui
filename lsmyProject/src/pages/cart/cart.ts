import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient} from '@angular/common/http'
import { LoginPage } from '../login/login';
import { OrderConfirmPage } from '../order-confirm/order-confirm';

/**
 * Generated class for the CartPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-cart',
  templateUrl: 'cart.html',
})
export class CartPage {
  myList = []
  isAllSelected = false

  constructor(
    
    private myHttp:HttpClient,public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidEnter() {
    var url = "http://localhost:8000/cart/list";

    this.myHttp.get(url,{withCredentials:true})
    .subscribe((result:any)=>{
      console.log(result)
      if(result.code == 300){
        //跳转到login
        this.navCtrl.push(LoginPage)
      }else if(result.code == 200){
        //result.data 就是购物车的数据
        this.myList = result.data
       // console.log(this.myList)
        //希望myList这个对象数组中的每一个对象都有一个属性来记录商品是否被选中
        for(var i=0;i<this.myList.length;i++){
          this.myList[i].isSelected=false
        }
      
      }
    })
  }

  shopping(){
    //跳转到首页
    this.navCtrl.parent.select(0)
  }
  // 触发了全选的ngModelChange事件，来执行此方法
  operateAll(){
    console.log(this.isAllSelected)
    for(var i=0;i<this.myList.length;i++){
      this.myList[i].isSelected = this.isAllSelected
    }
  }
  //操作了其中某一个商品的复选框
  operateOne(){
   //遍历购物车列表myList，将每一个商品的isSelected做一个逻辑与运算，将与运算的结果给isAllSelected
   /*
   var result = true;
   for(var i=0;i<this.myList.length;i++){
     result = result && this.myList[i].isSelected
   }*/
   var result = true;
   for(var i=0;i<this.myList.length;i++){
     if(!this.myList[i].isSelected){
       result = false
       break;
     }
   }
   this.isAllSelected = result
  }

  calcTotalPrice(){
    var totalPrice = 0
    for(var i=0;i<this.myList.length;i++){
      if(this.myList[i].isSelected){
        var p = this.myList[i]
        totalPrice+=(p.price*p.count)
      }
    }
    return totalPrice
  }

  /**
   * 修改某一个商品的数量的
   * @param isAdd 是否要往上加
   * @param index 修改的商品的下标
   */
  modifyCount(isAdd,index){
    if(isAdd){
      this.myList[index].count++
    }else{
      // 边界值的判断
      if(this.myList[index].count == 1){
        return
      }
      this.myList[index].count--
    }
    //回头在此记得通知服务器更新:http://localhost:8000/cart/updatecount
  }

  // 跳转到订单确认的页面
  jumpToSubmit(){
    this.navCtrl.push(OrderConfirmPage)
  }


}
