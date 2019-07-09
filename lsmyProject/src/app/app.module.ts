import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import {HttpClientModule} from '@angular/common/http'

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';
import { IndexPage } from '../pages/index';
import { DetailPage } from '../pages/detail/detail';
import { CartPage } from '../pages/cart/cart';
import { LoginPage } from '../pages/login/login';
import { OrderConfirmPage } from '../pages/order-confirm/order-confirm';
import { PayPage } from '../pages/pay/pay';
import { UserCenterPage } from '../pages/user-center/user-center';
import { NotFoundPage } from '../pages/not-found/not-found';
import { RegPage } from '../pages/reg/reg';

@NgModule({
  declarations: [
    IndexPage,
    DetailPage,
    CartPage,
    LoginPage,
    OrderConfirmPage,
    PayPage,
    UserCenterPage,
    NotFoundPage,
    MyApp,
    HomePage,
    RegPage

  ],
  imports: [
    HttpClientModule,
    BrowserModule,
    IonicModule.forRoot(MyApp),
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    IndexPage,
    DetailPage,
    CartPage,
    LoginPage,
    OrderConfirmPage,
    PayPage,
    UserCenterPage,
    NotFoundPage,
    MyApp,
    HomePage,
    RegPage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
