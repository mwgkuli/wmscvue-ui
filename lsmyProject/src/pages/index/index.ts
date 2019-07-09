import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import {HttpClient} from '@angular/common/http'
import { DetailPage } from '../detail/detail';

/**
 * Generated class for the IndexPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-index',
  templateUrl: 'index.html',
})
export class IndexPage {
  detail = DetailPage;
  cList = [] //保存轮播图数据
  nList = [] //保存横向滚动的容器中数据
  rList = [] //保存缩略图数组

  constructor(
    private myHttp:HttpClient,
    public navCtrl: NavController, public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad IndexPage');
    // 发请求 保存数据 渲染数据
    var url = "http://localhost:8000/index";
    this.myHttp.get(url)
    .subscribe((result:any)=>{
      //console.log(result)
      //需要展示轮播图，需要将result.carouselItems保存 然后到视图中通过ionSlides进行展示
      this.cList = result.carouselItems;
      //console.log(this.cList)
      // 将result.newArrialItems保存，然后到视图中通过ionScroll来显示
      this.nList = result.gg
      //console.log(this.nList)
      // 将result.recommendedItems保存，显示在缩略图列表
      //rList = [] //保存缩略图数组
      this.rList = result.recommendedItems;
      
    })
  }

}
