set names utf8;
drop database if exists wmsc;
create database wmsc charset=utf8;
use wmsc;
#注册
create table wmsc_user(
	uid int primary key auto_increment,#用户的id为用户的唯一标识，有系统自动生成
	uname varchar(32),
	upwd  varchar(32),
	phone varchar(16),#手机号码
	email  varchar(60),#用户邮箱
	user_name varchar(32),#用户姓名
	avatar varchar(128),#头像图片
	gender bool#性别
	);
#收货人信息
create table wmsc_receiver_address(
	aid int primary key auto_increment,
	user_id int,#用户编号
	reciver varchar(16),#接收人姓名
	province varchar(16),#省
	city varchar(16),#市
	county varchar(10),#县
	address varchar(128),#详细地址
	cellphone varchar(16),#手机
	fixedphone varchar(20),#固定电话
	postcode char(6),#邮编
	tag    varchar(10),#标签名
	is_default varchar(10)#是否为当前用户的默认收货地址
);
/**购物车条目**/
CREATE TABLE wmsc_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
#购物车
create table wmsc_shopping_car(
	cid int primary key auto_increment,
	user_id int,#用户编号
	product_id int,#商品编号
	count int#购买数量
);

#订单状态
create table wmsc_order(
	aid int primary key auto_increment,
	user_id int,#用户编号
	address_id varchar(20),
	status int,#订单状态 1.等待付款2.等待发货3.运输中4.已签收5.已取消
	order_time int,#下单时间
	pay_time int,#付款时间
	deliver_time int,#发货时间
	received_time int#签收时间
);
#订单详情
create table wmsc_order_detail(
	did int primary key auto_increment,
	order_id int,#订单编号
	product_id int,#产品编号
	count int#购买数量
);
#商品分类
create table wmsc_laptop_family(	
	fid int primary key auto_increment,
	img varchar(128),#图片路径
	name varchar(32)#类别名称
	
);
insert into wmsc_laptop_family values
(1,'/picture/46a762db-d63e-4c6e-9d63-0bbb986905ba.jpg','DOTA神秘商店'), 
(2,'/picture/46a762db-d63e-4c6e-9d63-0bbb986905ba.jpg','电竞外设专区'), 
(3,'/picture/46a762db-d63e-4c6e-9d63-0bbb986905ba.jpg','GSGO正版周边');
#广告位
create table wmsc_gg(
	img varchar(128)#图片路径
);
insert into wmsc_gg values
('gg/58c1278cc6e54670ab72d6f9b9b3f235.jpg'),
('gg/a0d5b5ec5f284a04b84efb5c9d937817.jpg'),
('gg/c276224a840b45ffb81d04a457f689d1.jpg');

#商品
create table wmsc_laptop(
	lid int primary key AUTO_INCREMENT,#1
	family_id int,#2所属型号家族编号
	product_id int,#3产品编号
	title varchar(200),#4主标题
	subtitle varchar(128),#5副标题
	price decimal(10,2),#6价格
	promise varchar(64),#7服务承诺
	spec varchar(64),#8规格颜色
	#name varchar(64),#9商品名称
	#os varchar(32),#10操作系统
	#memory varchar(32),#11内存容量
	#resolution varchar(32),#12分辨率
	#video_card varchar(32),#13显存容量
	#category varchar(32),#14所属分类
	#disk varchar(32),#15硬盘容量及类型
	details varchar(1024),#产品详细说明
	shelf_time bigint,#16上架时间
	sold_count int,#已售出的数量
	is_onsale bool #17是否促销中
);
#DOTA神秘商店   
insert into wmsc_laptop values
#(null,1,01,'DOTA - 扭蛋手办II','快速来加入我们的篝火晚会','￥69','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','#','img','2018-01-11','#',0),
#(null,1,02,'DOTA - TI8主题无檐帽','用它来抵御严寒烧灼','￥169','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','#','img','2018-01-11','#',1),
#(null,1,03,'2019年国际邀请赛卫衣','轻松的运动风格才是电子竞技','￥499','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','S M L XL XXL','img','2018-01-11','#',0),
#(null,1,04,'DOTA - 鼠标垫 血战之命','无休止的战斗，谁能到最后','￥239','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','#','img','2018-01-11','#',0),
#(null,1,05,'DOTA - 发条技师 马克杯','重新上发条，带给你无限续倍的魔力','￥69','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','#','img','2018-01-11','#',0),
#(null,1,06,'DOTA - TI8主题选手服','世界在仰望你们背后的名字','￥4999','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','S M L XL XXL','img','2018-01-11','#',0),
#电竞外设专区
(null,2,07,'赛睿Apex M500专业游戏背光机械键盘有线104cherry樱桃红轴青轴','CHERRY MX青红轴 蓝色背光呼吸灯','819','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'青轴 红轴','<div>
                    <img src="details2f1/1524477519267052000.jpg" alt=""/>
                    <img src="details2f1/1524477522006070273.jpg" alt=""/>
                    <img src="details2f1/1524477524665071439.jpg" alt=""/>
                    <img src="details2f1/1524477528254021879.jpg" alt=""/>
                    <img src="details2f1/1524477531144081544.jpg" alt=""/>
                    <img src="details2f1/1524477534036095638.jpg" alt=""/>
                    <img src="details2f1/1524477536792086286.jpg" alt=""/>
                    <img src="details2f1/1524477539505032788.jpg" alt=""/>
                    <img src="details2f1/1524477541952046108.jpg" alt=""/>
                    <img src="details2f1/1524477544629025392.jpg" alt=""/>
                    <img src="details2f1/1524477547646070570.jpg" alt=""/>
                    <img src="details2f1/1524477550696056362.jpg" alt=""/>
                    <img src="details2f1/1524477553360016472.jpg" alt=""/>
                    <img src="details2f1/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,08,'steelseries/赛睿 Arctis 3寒冰3RGB游戏耳机7.1','零延迟无线音频DTS 7.1环绕声','629','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f2/1524205842520043738.jpg" alt=""/>
                    <img src="details2f2/1524205845348021939.jpg" alt=""/>
                    <img src="details2f2/1524205848566058609.jpg" alt=""/>
                    <img src="details2f2/1524205851232007646.jpg" alt=""/>
                    <img src="details2f2/1524205854115086711.jpg" alt=""/>
                    <img src="details2f2/1524205857001065326.jpg" alt=""/>
                    <img src="details2f2/1524205859740095728.jpg" alt=""/>
                    <img src="details2f2/1524205862444015200.jpg" alt=""/>
                    <img src="details2f2/1524205865477038981.jpg" alt=""/>
                    <img src="details2f2/1524205868109002649.jpg" alt=""/>
		    <img src="details2f2/1524205918775079647.jpg" alt=""/>
		    <img src="details2f2/1524205923505084708.jpg" alt=""/>
		    <img src="details2f2/1525784551530004520.jpg" alt=""/>


                </div>','2018-01-11','#',1),
(null,2,09,'steelseries/赛睿 Arctis 7寒冰7 头戴式无线游戏耳机麦7.1','零延迟无线音频DTS 7.1环绕声','1349','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f3/1524214114454008128.jpg" alt=""/>
                    <img src="details2f3/1524214116816003537.jpg" alt=""/>
                    <img src="details2f3/1524214119436056845.jpg" alt=""/>		 
                    <img src="details2f3/1524214121892094186.jpg" alt=""/>
                    <img src="details2f3/1524214124758078585.jpg" alt=""/>
                    <img src="details2f3/1524214127334099835.jpg" alt=""/>
                    <img src="details2f3/1524214129948069458.jpg" alt=""/>
                    <img src="details2f3/1524214132719096724.jpg" alt=""/>
                    <img src="details2f3/1524214135429085585.jpg" alt=""/>
                    <img src="details2f3/1525784683540087557.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,10,'teelseries/赛睿 Arctis Pro 头戴式 游戏耳机耳麦','最新上市，炫彩RGB灯效 支持VX2.0环绕声','1499','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f1/1524477519267052000.jpg" alt=""/>
                    <img src="details2f1/1524477522006070273.jpg" alt=""/>
                    <img src="details2f1/1524477524665071439.jpg" alt=""/>
                    <img src="details2f1/1524477528254021879.jpg" alt=""/>
                    <img src="details2f1/1524477531144081544.jpg" alt=""/>
                    <img src="details2f1/1524477534036095638.jpg" alt=""/>
                    <img src="details2f1/1524477536792086286.jpg" alt=""/>
                    <img src="details2f1/1524477539505032788.jpg" alt=""/>
                    <img src="details2f1/1524477541952046108.jpg" alt=""/>
                    <img src="details2f1/1524477544629025392.jpg" alt=""/>
                    <img src="details2f1/1524477547646070570.jpg" alt=""/>
                    <img src="details2f1/1524477550696056362.jpg" alt=""/>
                    <img src="details2f1/1524477553360016472.jpg" alt=""/>
                    <img src="details2f1/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,11,'赛睿 rival 600 有线游戏鼠标rgb宏编程双传感防滑','双传感 防抖动 1比1追踪','629','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f5/1524477519267052000.jpg" alt=""/>
                    <img src="details2f5/1524477522006070273.jpg" alt=""/>
                    <img src="details2f5/1524477524665071439.jpg" alt=""/>
                    <img src="details2f5/1524477528254021879.jpg" alt=""/>
                    <img src="details2f5/1524477531144081544.jpg" alt=""/>
                    <img src="details2f5/1524477534036095638.jpg" alt=""/>
                    <img src="details2f5/1524477536792086286.jpg" alt=""/>
                    <img src="details2f5/1524477539505032788.jpg" alt=""/>
                    <img src="details2f5/1524477541952046108.jpg" alt=""/>
                    <img src="details2f5/1524477544629025392.jpg" alt=""/>
                    <img src="details2f5/1524477547646070570.jpg" alt=""/>
                    <img src="details2f5/1524477550696056362.jpg" alt=""/>
                    <img src="details2f5/1524477553360016472.jpg" alt=""/>
                    <img src="details2f5/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,12,'steelseries/赛睿 Rival 700有线游戏鼠标rgb幻彩呼吸灯','赛睿正版RGB灯光 防滑侧裙','699','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f1/1524477519267052000.jpg" alt=""/>
                    <img src="details2f1/1524477522006070273.jpg" alt=""/>
                    <img src="details2f1/1524477524665071439.jpg" alt=""/>
                    <img src="details2f1/1524477528254021879.jpg" alt=""/>
                    <img src="details2f1/1524477531144081544.jpg" alt=""/>
                    <img src="details2f1/1524477534036095638.jpg" alt=""/>
                    <img src="details2f1/1524477536792086286.jpg" alt=""/>
                    <img src="details2f1/1524477539505032788.jpg" alt=""/>
                    <img src="details2f1/1524477541952046108.jpg" alt=""/>
                    <img src="details2f1/1524477544629025392.jpg" alt=""/>
                    <img src="details2f1/1524477547646070570.jpg" alt=""/>
                    <img src="details2f1/1524477550696056362.jpg" alt=""/>
                    <img src="details2f1/1524477553360016472.jpg" alt=""/>
                    <img src="details2f1/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,13,'steelseries/赛睿 Rival 100光学有线电竞游戏鼠标rgb幻彩呼吸灯','小尺寸设计 防滑侧裙','199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'黑色Arctis3 白色Arctis3','<div>
                    <img src="details2f1/1524477519267052000.jpg" alt=""/>
                    <img src="details2f1/1524477522006070273.jpg" alt=""/>
                    <img src="details2f1/1524477524665071439.jpg" alt=""/>
                    <img src="details2f1/1524477528254021879.jpg" alt=""/>
                    <img src="details2f1/1524477531144081544.jpg" alt=""/>
                    <img src="details2f1/1524477534036095638.jpg" alt=""/>
                    <img src="details2f1/1524477536792086286.jpg" alt=""/>
                    <img src="details2f1/1524477539505032788.jpg" alt=""/>
                    <img src="details2f1/1524477541952046108.jpg" alt=""/>
                    <img src="details2f1/1524477544629025392.jpg" alt=""/>
                    <img src="details2f1/1524477547646070570.jpg" alt=""/>
                    <img src="details2f1/1524477550696056362.jpg" alt=""/>
                    <img src="details2f1/1524477553360016472.jpg" alt=""/>
                    <img src="details2f1/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),
(null,2,14,'赛睿 Rival 300s有线rgb游戏鼠标csgo','rgb灯光 赛睿微动 大手人体工学','319','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','<div>
                    <img src="details2f1/1524477519267052000.jpg" alt=""/>
                    <img src="details2f1/1524477522006070273.jpg" alt=""/>
                    <img src="details2f1/1524477524665071439.jpg" alt=""/>
                    <img src="details2f1/1524477528254021879.jpg" alt=""/>
                    <img src="details2f1/1524477531144081544.jpg" alt=""/>
                    <img src="details2f1/1524477534036095638.jpg" alt=""/>
                    <img src="details2f1/1524477536792086286.jpg" alt=""/>
                    <img src="details2f1/1524477539505032788.jpg" alt=""/>
                    <img src="details2f1/1524477541952046108.jpg" alt=""/>
                    <img src="details2f1/1524477544629025392.jpg" alt=""/>
                    <img src="details2f1/1524477547646070570.jpg" alt=""/>
                    <img src="details2f1/1524477550696056362.jpg" alt=""/>
                    <img src="details2f1/1524477553360016472.jpg" alt=""/>
                    <img src="details2f1/1525784844941053991.jpg" alt=""/>
                </div>','2018-01-11','#',1),

#GSGO正版周边
(null,3,15,'CS:GO Logo 针织帽','CS:GO正版周边 国内首发 下单后预计发货时间为18年','￥69','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','img','2018-01-11','#',0),
(null,3,16,'CS:GO 网络棒球帽','CS:GO正版周边 国内首发 下单后预计发货时间为18年','￥239','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','img','2018-01-11','#',0),
(null,3,17,'CS:GO 全球攻势鼠标垫','CS:GO正版周边 国内首发 下单后预计发货时间为18年','￥219','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','img','2018-01-11','#',0),
(null,3,18,'CS:GO 爪子刀 T恤','CS:GO正版周边 国内首发 下单后预计发货时间为18年建议选购小一号','￥199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'S M L XL XXL','img','2018-01-11','#',0),
(null,3,19,'CS:GO 电竞 Logo T恤','CS:GO正版周边 国内首发 下单后预计发货时间为18年建议选购小一号','￥199','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'S M L XL XXL','img','2018-01-11','#',0),
(null,3,20,'CS:GO 全球攻势马克杯','CS:GO正版周边 国内首发 下单后预计发货时间为18年','￥129','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','img','2018-01-11','#',0),
(null,3,21,'CS:GO 暴怒野兽帽衫','CS:GO正版周边 国内首发 下单后预计发货时间为18年','￥549','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
'#','img','2018-01-11','#',0);
#姜小虎周边专区
#(null,3,22,'姜小虎-多表情手捂','正版姜小虎 Q萌可爱 小手捂','￥68','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,23,'姜小虎-福袋','正版姜小虎 限量50套 内含4-6样周边','￥122','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,24,'姜小虎-背包','正版姜小虎 背包 贱萌小虎','￥99','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,25,'姜小虎-货郎小虎手办','正版姜小虎 手办 完美10周年','￥288','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,26,'姜小虎-抱腿腰包','正版姜小虎 创意腰包 独特设计','￥99','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,27,'姜小虎-多表情手捂','正版姜小虎 Q萌可爱 小手捂','￥68','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0),
#(null,28,'姜小虎-表情口罩','正版姜小虎 表情口罩 抗PM2.5','￥12','*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货',
#'#','img','2018-01-11','#',0);

#商品图片details
create table wmsc_laptop_pic(
	pid int primary key auto_increment,
	laptop_id int,#笔记本电脑型号
	lg1 varchar(128),#大图路径
	lg2 varchar(128),#大图路径
	lg3 varchar(128),#大图路径
	lg4 varchar(128),#大图路径
	md1 varchar(128),#中图路径
	md2 varchar(128),#中图路径
	md3 varchar(128),#中图路径
	md4 varchar(128),#中图路径
	sm1 varchar(128),#小图路径
	sm2 varchar(128),#小图路径
	sm3 varchar(128),#小图路径
	sm4 varchar(128)#小图路径
	
);
insert into wmsc_laptop_pic values
(null,2,'details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f1/aa2e62c7ae6249d9a245efe1f0465638.jpg','details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f1/a9641b7078b7469d874f1538c6a9e876.jpg','details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f1/aa2e62c7ae6249d9a245efe1f0465638.jpg','/details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f1/a9641b7078b7469d874f1538c6a9e876.jpg','details2f1/50f84bb2a333483e9e9d2dfaf228dacb_100.jpg','details2f1/aa2e62c7ae6249d9a245efe1f0465638_100.jpg','details2f1/9b9e53ee1dbc43e080b042d2f73444d3_100.jpg','details2f1/a9641b7078b7469d874f1538c6a9e876_100.jpg'),
(null,2,'/details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','/details2f1/aa2e62c7ae6249d9a245efe1f0465638.jpg','imgl','imgl','details2f2/724b02ae474643588116cc566166bafa.jpg','details2f2/fe969e581d2d45719977be34c881e9ad.jpg','/details2f2/1524205842520043738.jpg','details2f2/1524205923505084708.jpg','imgs','imgs','imgs','imgs'),
(null,2,'details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f1/aa2e62c7ae6249d9a245efe1f0465638.jpg','/details2f1/9b9e53ee1dbc43e080b042d2f73444d3.jpg','details2f2/a9641b7078b7469d874f1538c6a9e876.jpg','/details2f3/1d0a2af53c5b495da0316e2609a6e8d3.jpg','details2f3/1524214114454008128.jpg','details2f3/632b616ecac04380b28de3c4e502ff4b.jpg','details2f3/1524214135429085585.jpg','s/details2f1/50f84bb2a333483e9e9d2dfaf228dacb_100.jpg','s/details2f1/aa2e62c7ae6249d9a245efe1f0465638_100.jpg','s/details2f1/9b9e53ee1dbc43e080b042d2f73444d3_100.jpg','s/details2f1/a9641b7078b7469d874f1538c6a9e876_100.jpg'),
(null,2,'img','img','img','img','img1','img2','img3','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img'),
(null,2,'img','img','img','img','img','img','img','img','img','img','img','img');


#轮播图图片
create table wmsc_index_carousel(
	cid int primary key auto_increment,
	img varchar(128),#图片路径
	title varchar(64),#图片路径
	href varchar(128)#图片链接
);
insert into wmsc_index_carousel values
(null,'lunbo/0cb9ca00e3a9451a9aee4a961527051d.jpg','轮播广告商品1','lunbo/banner1.png'),
(null,'lunbo/0cb9ca00e3a9451a9aee4a961527051d.jpg','轮播广告商品2','lunbo/banner2.png'),
(null,'lunbo/0cb9ca00e3a9451a9aee4a961527051d.jpg','轮播广告商品3','lunbo/banner3.png'),
(null,'lunbo/0cb9ca00e3a9451a9aee4a961527051d.jpg','轮播广告商品4','lunbo/banner4.png');
#DOTA神秘商店
create table wmsc_index_product(
	pid int primary key auto_increment,
	title varchar(64),#商品标题
	#details varchar(128),#详细描述
	pic varchar(128),#图片
	price decimal(10,2),#商品价格
	href varchar(128),
	seq_recommended tinyint,
	seq_new_arrival tinyint,
	seq_top_sale tinyint
);
insert into wmsc_index_product values
#(null,'#','images/1f/93f67a9f-09aa-473a-9dda-da8add66db93.jpg','#','#',"#","#","#"),#dota 1fimg
#(null,'DOTA2 -扭蛋手办II','img','69','#',1,1,1), 
#(null,'DOTA2-2018年国际邀请赛 卫衣 ','images/1f/ee8e53f5304f44b9979a4be23ef811f8.jpg','499','#',1,1,1), 
#(null,'DOTA2 - TI8主题无檐帽 ','images/1f/c914900efe794fc6af1573dadf77339e.jpg','169','#',1,1,1), 
#(null,'DOTA2-鼠标垫 血战之命','images/1f/add9ec7f07fe48d3a63157591e9177f9.jpg','239','#',1,1,1), 
#(null,'DOTA2-发条技师 马克杯','images/1f/665c1d75873547f38e822c6ce669ff7c.jpg','248','#',1,1,1), 
#(null,'DOTA2 T18主题选手服','images/1f/0cf00df0ed144db490d392c9dd76b4d3.jpg','499','#',1,1,1),
#电竞外设专区
#(null,'#','/images/2f/8b3cd23eae73440aaa030fd6bdf11e56.jpg','#','#',"#","#","#"),#电竞外设img
(null,'赛睿 Apex M500 专业游戏背光机械键盘有线104cherry樱桃','/images/2f/e1dde6d7d1e849d7b735a5436b1e5638_160.jpg','819','detais.html?lid=1
',1,1,1),#1 
(null,'steelseries/赛睿 Arctis 3 寒冰3 rgb游戏耳机7.1尽显你的美','/images/2f/321e90c6749c4ee2806dc475df3a7002_160.jpg','629','detais.html?lid=2',1,1,1), #2
(null,'steelseries/赛睿 Arctis 7 寒冰7 头戴式无线游戏耳机麦','images/2f/b19d1b26b1134dab954e63ac927c38e3_160.jpg','1349','detais.html?lid=3',1,1,1),#3 
(null,'teelseries/赛睿 Arctis Pro 寒冰 Pro 头戴式 游戏耳机耳麦','images/2f/e280710b9faa4432b4e7f951103b5c80_160.jpg','1499','detais.html?lid=4',1,1,1),#4 
(null,'赛睿 rival 600 有线游戏鼠标rgb宏编程双传感防滑侧裙配重','images/2f/d4dca05806744e368b07e1bd45041933_160.jpg','659','detais.html?lid=5',1,1,1), #5
(null,'SteelSeries赛睿 Rival 700有线游戏鼠标rgb幻彩呼吸灯','images/2f//1f081573f16f4c89af51b29931acec93_160.jpg','699','detais.html?lid=6',1,1,1), #6
(null,'SteelSeries赛睿 Rival 100光学有线电竞游戏鼠标rgb呼吸灯','images/2f/da24ca0d6a0843d086f8c7c79e125975_160.jpg','199','detais.html?lid=7',1,1,1), #7
(null,'赛睿 Rival 300s 有线RGB游戏鼠标csgo 引领时尚潮流','images/2f/15b0aefece3543b8be54b011ad64b5f9_160.jpg','319','detais.html?lid=8',1,1,1),#8
#CSGO正版周边
#(null,'#','images/4f/7a580e48-595c-4f11-847c-f81e95219bba.jpg','#','#',"#","#","#"),#CSGO正版周边img
(null,'CS:GO Logo 针织帽','images/4f/b8db6d51049d4ad38e31161a3dc3d46d.jpg','149','detais.html?lid=9',1,1,1),#1 
(null,'CS:GO 网络棒球帽','images/4f/87d7862ea54a444ab95011545c9005b9.jpg','239','detais.html?lid=10',1,1,1),#2
(null,'CS:GO 全球攻击鼠标垫','/images/4f/83422fd537234d93b51bfae8437a2295.jpg','219','detais.html?lid=11',1,1,1),#3
#(null,'CS:GO 爪子刀 T恤','.images/4f/7b79b18f8b6f46bca45b3b8feeb203fc.jpg','199','detais.html?lid=12',1,1,1),#4
(null,'CS:GO 电竞 Logo T恤','images/4f/87d7862ea54a444ab95011545c9005b9.jpg','199','detais.html?lid=13',1,1,1),#5
(null,'CS:GO 全球攻势马克杯','images/4f/b8db6d51049d4ad38e31161a3dc3d46d.jpg','129','detais.html?lid=14',1,1,1),#6
(null,'CS:GO 暴怒野兽帽衫','images/4f/82fba9e52ccc42a8aae507d656da2130.jpg','549','#',1,1,1);#1 




