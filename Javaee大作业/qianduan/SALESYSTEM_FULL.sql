/*
 SQLyog Ultimate v12.09 (64 bit)
 MySQL - 5.7.33 : Database - salesystem
 *********************************************************************
 */

/*!40101 SET NAMES utf8 */

;

/*!40101 SET SQL_MODE=''*/

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

CREATE DATABASE
    /*!32312 IF NOT EXISTS*/
    `salesystem`
    /*!40100 DEFAULT CHARACTER SET utf8 */
;

USE `salesystem`;

/*Table structure for table `evaluation` */

DROP TABLE IF EXISTS `evaluation`;

CREATE TABLE
    `evaluation` (
        `uID` varchar(10) NOT NULL COMMENT '用户ID',
        `merID` varchar(13) NOT NULL COMMENT '商品ID',
        `star` decimal(1, 0) DEFAULT NULL,
        `message` text COMMENT '评价内容',
        KEY `uID` (`uID`),
        KEY `merID` (`merID`),
        CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`uID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`merID`) REFERENCES `merchandise` (`merID`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `evaluation` */

/*Table structure for table `merchandise` */

DROP TABLE IF EXISTS `merchandise`;

CREATE TABLE
    `merchandise` (
        `merID` varchar(13) NOT NULL COMMENT '商品ID',
        `merName` varchar(200) NOT NULL COMMENT '商品名称',
        `merClass` char(8) NOT NULL COMMENT '商品分类',
        `merRes` varchar(200) DEFAULT '/res/merchandise/',
        `merPrice` decimal(9, 2) NOT NULL COMMENT '商品价格',
        `merCount` int(11) NOT NULL COMMENT '商品库存',
        `merDes` varchar(500) DEFAULT NULL,
        PRIMARY KEY (`merID`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `merchandise` */

insert into
    `merchandise`(
        `merID`,
        `merName`,
        `merClass`,
        `merRes`,
        `merPrice`,
        `merCount`,
        `merDes`
    )
values (
        '123rfret24fwx',
        'AirPods',
        '数码物品',
        '/res/merchandise/123rfret24fwx.jpg',
        '1126.00',
        1,
        'Apple AirPods 配充电盒 Apple蓝牙耳机 适用iPhone/iPad/Apple Watch'
    ), (
        '28ch38h38hdh2',
        '得力 订书钉',
        '文具用品',
        '/res/merchandise/28ch38h38hdh2.jpg',
        '15.50',
        10,
        '得力(deli)轻便型厚层订书机/订书器 金属材质可钉50页 银色0416 '
    ), (
        '378fhe38vchue',
        '推出式橡皮擦',
        '文具用品',
        '/res/merchandise/378fhe38vchue.jpg',
        '2.20',
        25,
        ' 得力(deli)30块小号学生橡皮擦 美术绘图橡皮 书写办公橡皮擦 可爱小饿魔系列 71123A'
    ), (
        '73hdu483udhe2',
        'C语言程序设计现代方法',
        '各类书籍',
        '/res/merchandise/73hdu483udhe2.jpg',
        '62.30',
        12,
        'C语言程序设计：现代方法（第2版）(图灵出品) [C Programming:A Modern Approach,Second Edition]'
    ), (
        '73ubvu383hdhe',
        '得力文具盒',
        '文具用品',
        '/res/merchandise/73ubvu383hdhe.jpg',
        '120.00',
        3,
        '得力 文具礼盒套装小学生 六一儿童大礼包礼物学习用品卷笔刀组合礼物奖品 开学套装低年级/樱花女生款'
    ), (
        '9cd3h38dj29d2',
        '无痕改正带',
        '文具用品',
        '/res/merchandise/9cd3h38dj29d2.jpg',
        '22.80',
        130,
        '得力(deli)210米 加大容量修正带 顺滑不断带涂改带 复印无痕改正带 豪享装71524 6个装'
    ), (
        'cew329rdeui32',
        '蓝月亮洗衣液2+1',
        '其他物品',
        '/res/merchandise/cew329rdeui32.jpg',
        '79.50',
        12,
        '【2套减30】蓝月亮洗衣液12斤套装 机洗3kg*1瓶+2kg*1瓶+1kg*1瓶 深层洁净'
    ), (
        'ciwi9292d8929',
        '施华蔻洗发露',
        '其他物品',
        '/res/merchandise/ciwi9292d8929.jpg',
        '69.00',
        23,
        '施华蔻(Schwarzkopf)多效修护19洗发露600ml(洗发水洗头膏洗发液 含3重氨基酸 顺滑 男士女士)(新老包装随机)'
    ), (
        'd29shd92hfd92',
        '口罩 50只/盒',
        '其他物品',
        '/res/merchandise/d29shd92hfd92.jpg',
        '21.90',
        75,
        '稳健（Winner）医用外科口罩 三层防护含熔喷层防细菌花粉 细菌过滤率大于95% 抽取式盒装设计 50只/盒'
    ), (
        'd82dxjh2w9djh',
        '狼蛛键盘',
        '数码物品',
        '/res/merchandise/d82dxjh2w9djh.jpg',
        '119.00',
        2,
        '狼蛛（AULA）F2088机械键盘 有线键盘 游戏键盘 104键背光键盘 宏编程 电脑键盘 黑色 青轴 精英版'
    ), (
        'd83hd982jsdip',
        'Beats耳机十周年版',
        '数码物品',
        '/res/merchandise/d83hd982jsdip.jpg',
        '1198.00',
        2,
        'beats studio3 Wireless录音师3 头戴式无线蓝牙主动降噪耳机安卓苹果音乐游戏耳机 桀骜黑红（十周年版）'
    ), (
        'dh229dj28wjed',
        '牙刷7支',
        '其他物品',
        '/res/merchandise/dh229dj28wjed.jpg',
        '29.80',
        13,
        'UPURITY成人超细软毛简装牙刷 防出血小头日系牙刷6只装ORISIMP系列 优雅6支装'
    ), (
        'dh28eh28dh28d',
        '乒乓球拍红双喜',
        '运动器材',
        '/res/merchandise/dh28eh28dh28d.jpg',
        '129.00',
        34,
        '红双喜DHS二星级乒乓球拍直拍套装T2006对拍(附拍包乒乓球)'
    ), (
        'dh292idu8ujdi',
        '小剪刀',
        '文具用品',
        '/res/merchandise/dh292idu8ujdi.jpg',
        '3.90',
        63,
        '得力(deli)170mm办公家用生活剪刀 1把 办公用品 黑色0603'
    ), (
        'dh298dh28eh10',
        '洗手液5+5',
        '其他物品',
        '/res/merchandise/dh298dh28eh10.jpg',
        '39.50',
        12,
        '蓝月亮 芦荟抑菌洗手液 500g瓶*2+500g瓶装补充液*2 抑菌洗手液 泡沫丰富 抑菌99.9% 洗手液补充装 '
    ), (
        'dh29dj28si29h',
        '健身弹力棒',
        '运动器材',
        '/res/merchandise/dh29dj28si29h.jpg',
        '99.00',
        12,
        '健身弹力棒菲利斯棒飞力仕杆菲力仕震颤棒多功能训练振颤棒wj 黑色'
    ), (
        'dhdeu29dhj289',
        '羽毛球拍 李宁',
        '运动器材',
        '/res/merchandise/dhdeu29dhj289.jpg',
        '269.00',
        5,
        '李宁LI-NING羽毛球拍双拍超轻高磅2支全碳素3U进攻对拍专业羽拍（送6球穿线）'
    ), (
        'diu82jdi12osk',
        '卫衣 男 XL',
        '穿搭物品',
        '/res/merchandise/diu82jdi12osk.jpg',
        '98.00',
        2,
        '南极人卫衣男宽松春夏季男士圆领套头薄款刺绣拼接长袖T恤男潮牌男装休闲运动个性学生衣服打底衫外套卫衣男 深灰色 XL '
    ), (
        'dj29dj29ejdi2',
        '黄色T恤 女 XL',
        '穿搭物品',
        '/res/merchandise/dj29dj29ejdi2.jpg',
        '128.00',
        3,
        '又只狼t恤女短袖女装夏装休闲套装女21年夏季新品卫衣女士上衣大码女装翻领衣服运动服韩版宽松休闲裤夏天 黄衣+白长裤 XL'
    ), (
        'dj329dh298eh2',
        '床头柜',
        '床上用品',
        '/res/merchandise/dj329dh298eh2.jpg',
        '24.90',
        23,
        '小茶几简约现代迷你小户型客厅边几角几卧室床头柜桌子小方几 30*30*32 浅胡桃'
    ), (
        'dj383jv39303d',
        'C语言程序设计',
        '各类书籍',
        '/res/merchandise/dj383jv39303d.jpg',
        '49.00',
        23,
        'C语言程序设计(第4版) 谭浩强'
    ), (
        'djbfe3288rjfd',
        'C程序设计(第三版) ',
        '各类书籍',
        '/res/merchandise/djbfe3288rjfd.jpg',
        '33.50',
        10,
        'C程序设计(第三版)'
    ), (
        'djw929dj20dj9',
        'iPad 11 Pro',
        '数码物品',
        '/res/merchandise/djw929dj20dj9.jpg',
        '6199.00',
        1,
        'Apple iPad Pro 11英寸平板电脑 2021年新款(128G WLAN版/M1芯片Liquid视网膜屏/MHQR3CH/A) 深空灰色 '
    ), (
        'du29sdh29sj20',
        '枕头',
        '床上用品',
        '/res/merchandise/du29sdh29sj20.jpg',
        '18.80',
        3,
        '南极人 Nanjiren 枕芯家纺 印花羽丝绒枕头 高弹力酒店舒适枕头芯 胡子先生 一只装 '
    ), (
        'dueu28d282js2',
        '握力器',
        '运动器材',
        '/res/merchandise/dueu28d282js2.jpg',
        '25.00',
        12,
        '【5-60KG可调】业 都 握力器臂力男器女专业A型指力器手指康复训练腕力前臂肌肉家用健身器材 升级款握力器'
    ), (
        'duweu29dsjh29',
        '床头小风扇',
        '床上用品',
        '/res/merchandise/duweu29dsjh29.jpg',
        '39.30',
        10,
        '美菱（MELING）电风扇 家用宿舍迷你小风扇 床上办公室寝室静音台式台扇 强劲风力-3米风距'
    ), (
        'duwud92929d12',
        'PLAYBOY 裤子 XL',
        '穿搭物品',
        '/res/merchandise/duwud92929d12.jpg',
        '148.00',
        4,
        'BABIBOY休闲裤男夏季薄款韩版潮流松紧腰小脚男裤工装裤牛仔青年拼接束脚裤修身运动哈伦裤子男 997蓝灰+997军绿 XL码'
    ), (
        'f82drh28dfh29',
        'T恤 男 XL',
        '穿搭物品',
        '/res/merchandise/f82drh28dfh29.jpg',
        '58.00',
        6,
        '乐希源短袖t恤男2021夏季男士潮流半截袖圆领休闲宽松印花青年体恤潮牌打底衫男装衣服 3074白色 XL'
    ), (
        'fdj2299di2000',
        '裙子 M',
        '穿搭物品',
        '/res/merchandise/fdj2299di2000.jpg',
        '159.00',
        1,
        '苏洛琳21年连衣裙女装大码春夏季新款两件套套装裙子女士小个子韩版宽松印花时尚性感a字短袖衣服中长款 蓝色套装 M(建议 95-105斤) '
    ), (
        'fdjw29e9d2s02',
        '红米智能手表',
        '数码物品',
        '/res/merchandise/fdjw29e9d2s02.jpg',
        '299.00',
        3,
        'Redmi Watch 典雅黑 智能手表 运动监测 实时心率追踪 多功能NFC 智能语音助手 轻巧小方屏 红米手表 '
    ), (
        'fh28d2i8shd82',
        '血压计',
        '其他物品',
        '/res/merchandise/fh28d2i8shd82.jpg',
        '299.00',
        20,
        '欧姆龙（OMRON）电子血压计家用上臂式 医用血压测量仪 HEM-7124'
    ), (
        'fh29cj29dh1ie',
        '清风抽纸 24包',
        '其他物品',
        '/res/merchandise/fh29cj29dh1ie.jpg',
        '59.90',
        21,
        ' 清风（APP）抽纸 原木纯品金装系列 3层120抽软抽*24包纸巾 婴儿可用（整箱销售新老包装随机发货）'
    ), (
        'fheu28sji192j',
        '便签条',
        '文具用品',
        '/res/merchandise/fheu28sji192j.jpg',
        '11.90',
        2,
        '得力(deli)210枚多规格索引标签贴纸 分类荧光膜便利贴口取纸 半透明指示便签贴条 33503 '
    ), (
        'fiw92jd90wsjw',
        '外套 女 L',
        '穿搭物品',
        '/res/merchandise/fiw92jd90wsjw.jpg',
        '59.90',
        4,
        '尚涛防晒衣女2021夏装新款女装百搭宽松防晒服韩版长袖空调衫透气大码沙滩服薄款短款外套女 蓝色 L建议100-110斤'
    ), (
        'fu28d298wu119',
        '蓝牙音箱',
        '数码物品',
        '/res/merchandise/fu28d298wu119.jpg',
        '98.00',
        3,
        'dido X6无线蓝牙音箱迷你家用音响便携德国小钢炮插卡手机重低音炮户外音乐车载播放器电脑低音炮 升级版星耀黑【4重EQ音效+蓝牙5.0】'
    ), (
        'h2929dj29dj20',
        '单人被子',
        '床上用品',
        '/res/merchandise/h2929dj29dj20.jpg',
        '119.90',
        3,
        '南极人 Nanjiren 套件家纺 全棉四件套纯棉斜纹床上用品双人床单被套200*230cm 邱思特 1.5/1.8米床 '
    ), (
        'hd3hdu29dh2i7',
        '乒乓球拍 DHS',
        '运动器材',
        '/res/merchandise/hd3hdu29dh2i7.jpg',
        '399.00',
        2,
        '红双喜DHS 五星乒乓球拍 横拍碳素底板双面反胶皮R5002C (单拍赠拍套) '
    ), (
        'hdh29e9fhf92k',
        '古典吉他 全单',
        '其他物品',
        '/res/merchandise/hdh29e9fhf92k.jpg',
        '7480.00',
        23,
        '莱德里奥（laidelio）世界大师级手工全单古典吉他单板古典电箱莱德里奥吉它 39寸LC-60C三拼红松圆角电箱'
    ), (
        'hdu9jdi2hdf20',
        '考试水笔',
        '文具用品',
        '/res/merchandise/hdu9jdi2hdf20.jpg',
        '15.00',
        10,
        '得力(deli)直液笔中性笔 0.5mm子弹头签字笔学生考试笔走珠笔水笔 黑色 办公用品12支/盒S656'
    ), (
        'hdue83920wisj',
        'C语言程序设计',
        '各类书籍',
        '/res/merchandise/hdue83920wisj.jpg',
        '68.30',
        50,
        '现货包邮 C程序设计语言(第2版.新版)+习题解答 典藏版2册装C语言教材计算机教材8058344'
    ), (
        'hh3738hhrffuf',
        'c程序设计',
        '各类书籍',
        '/res/merchandise/hh3738hhrffuf.jpg',
        '31.80',
        20,
        'C程序设计（第五版）学习辅导/中国高等院校计算机基础教育课程体系规划教材'
    ), (
        'id829jdi829di',
        'T恤 男 L',
        '穿搭物品',
        '/res/merchandise/id829jdi829di.jpg',
        '49.90',
        2,
        '南极人T恤男短袖夏季薄款圆领休闲港风青少年学生宽松大码时尚印花半袖纯棉透气夏天男装衣服打底汗衫潮 水绿色(柯基男孩) L【推荐120-130斤左右】'
    ), (
        'jdh28eh2idj02',
        '乒乓球拍 729',
        '运动器材',
        '/res/merchandise/jdh28eh2idj02.jpg',
        '169.00',
        1,
        '729 乒乓球拍横拍长柄 7星七星VERY纯木乒乓球球拍进攻型'
    ), (
        'jdj239dj9ej2k',
        '圆枕头',
        '床上用品',
        '/res/merchandise/jdj239dj9ej2k.jpg',
        '69.00',
        23,
        '问雅 颈椎护颈枕圆柱圆形决明子枕头糖果型硬枕头成人颈椎脊椎枕单人劲椎牵引枕圆枕头 梦幻紫'
    ), (
        'jdj29dj29sdj2',
        '床上小桌板',
        '床上用品',
        '/res/merchandise/jdj29dj29sdj2.jpg',
        '39.00',
        16,
        '易漫 笔记本床上电脑桌折叠桌床上书桌学习桌小桌子带平板卡槽W腿防滑升级版浅木纹60*40*28CM '
    ), (
        'jdu383hu329dr',
        '零基础学C语言',
        '各类书籍',
        '/res/merchandise/jdu383hu329dr.jpg',
        '60.10',
        61,
        '零基础学C语言（全彩版）基础入门、实例进阶、实战练习，赠视频、源码、必刷题、电子魔卡 '
    ), (
        'js82hdu2hd892',
        '带标签稳固文件架',
        '文具用品',
        '/res/merchandise/js82hdu2hd892.jpg',
        '15.50',
        23,
        '得力(deli)四联镂空桌面文件框 四栏带标签稳固文件架/文件栏/文件筐/资料框 办公用品 蓝色27888 '
    ), (
        'ju289jd29idiw',
        '小米手环5',
        '数码物品',
        '/res/merchandise/ju289jd29idiw.jpg',
        '179.00',
        1,
        '小米手环 5 石墨黑 动态彩屏 心率运动手环50米防水女性健康24小时高精准心率监测磁吸式充电 '
    ), (
        's82jd92nhdhh2',
        'Python图书',
        '各类书籍',
        '/res/merchandise/s82jd92nhdhh2.jpg',
        '67.40',
        3,
        '数据荒岛求生——从Excel数据分析到Python数据分析'
    ), (
        's87288dh29dh3',
        '双人被',
        '床上用品',
        '/res/merchandise/s87288dh29dh3.jpg',
        '125.90',
        1,
        ' 南极人（Nanjiren） 套件家纺 全棉四件套纯棉斜纹床上用品双人床单被套200*230cm 佳丽斯 1.5/1.8米床'
    ), (
        's8w2jdj829dja',
        '连衣裙 XL',
        '穿搭物品',
        '/res/merchandise/s8w2jdj829dja.jpg',
        '159.00',
        4,
        '佬唐森连衣裙女装新品2021年春季夏装女短袖时尚雪纺新款显瘦大码女装条纹碎花两件套套装裙印花裙子女夏 杏色 L【建议115-130斤】'
    ), (
        'u29du28dhj29d',
        '小米6000M路由器',
        '数码物品',
        '/res/merchandise/u29du28dhj29d.jpg',
        '599.00',
        1,
        '小米路由器 AX6000 5G双频WIFI6 6000M速率 无线穿墙千兆 家用智能 电竞路由'
    ), (
        'udu29ds29sdj9',
        '床头灯',
        '床上用品',
        '/res/merchandise/udu29ds29sdj9.jpg',
        '69.00',
        20,
        '美的 (Midea)led台灯儿童学生学习阅读夹子灯宿舍寝室卧室床头书桌夹式小台灯可usb充电典雅白'
    ), (
        'udue8238ej299',
        '哑铃',
        '运动器材',
        '/res/merchandise/udue8238ej299.jpg',
        '159.00',
        2,
        '艾栢恩（AIBAIEN）哑铃男士健身器材哑铃杠铃套装家用可调节哑铃环保包胶20公斤30KG一对练臂肌 一副20公斤（单只10公斤）50厘米葫芦型连接器 '
    ), (
        'uewrygdsf939k',
        'C语言程序设计上机指导与习题解答',
        '各类书籍',
        '/res/merchandise/uewrygdsf939k.jpg',
        '34.40',
        125,
        '现货包邮 浙大 C语言程序设计 何钦铭 颜晖 第四版4版教材+实验习题指导第4版 2册高等教育出版社'
    ), (
        'xdjei29dj28id',
        '俯卧撑架',
        '运动器材',
        '/res/merchandise/xdjei29dj28id.jpg',
        '18.90',
        3,
        '杜威克 俯卧撑支架S型俯卧撑架体育运动锻炼健身器俯卧撑架 健身器材 一对装 黑色U型'
    );

/*Table structure for table `merimg` */

DROP TABLE IF EXISTS `merimg`;

CREATE TABLE
    `merimg` (
        `merID` varchar(13) NOT NULL COMMENT '商品ID',
        `merImg` mediumblob COMMENT '商品图片',
        KEY `merID` (`merID`),
        CONSTRAINT `merimg_ibfk_1` FOREIGN KEY (`merID`) REFERENCES `merchandise` (`merID`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `merimg` */

/*Table structure for table `orderstatus` */

DROP TABLE IF EXISTS `orderstatus`;

CREATE TABLE
    `orderstatus` (
        `uID` varchar(10) NOT NULL COMMENT '用户ID',
        `merID` varchar(13) NOT NULL COMMENT '商品ID',
        `status_` enum(
            '未付款',
            '待收货',
            '待评价',
            '已完成',
            '我的售卖'
        ) DEFAULT NULL COMMENT '订单状态',
        `time_` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建或改变时间',
        KEY `uID` (`uID`),
        KEY `merID` (`merID`),
        CONSTRAINT `orderstatus_ibfk_1` FOREIGN KEY (`uID`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orderstatus_ibfk_2` FOREIGN KEY (`merID`) REFERENCES `merchandise` (`merID`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `orderstatus` */

/*Table structure for table `purchasecart` */

DROP TABLE IF EXISTS `purchasecart`;

CREATE TABLE
    `purchasecart` (
        `user_id` varchar(10) NOT NULL,
        `merName` varchar(13) NOT NULL,
        `merPrice` decimal(9, 2) NOT NULL,
        `cnt` tinyint(4) NOT NULL,
        `time_` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (`user_id`, `merName`, `time_`),
        CONSTRAINT `purchasecart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `purchasecart` */

insert into
    `purchasecart`(
        `user_id`,
        `merName`,
        `merPrice`,
        `cnt`,
        `time_`
    )
values (
        'DXtFzTM6wQ',
        '便签条',
        '11.90',
        1,
        '2021-06-12 23:26:59'
    ), (
        'DXtFzTM6wQ',
        '健身弹力棒',
        '99.00',
        1,
        '2021-06-12 17:18:10'
    ), (
        'DXtFzTM6wQ',
        '得力 订书钉',
        '15.50',
        1,
        '2021-06-12 23:26:59'
    ), (
        'DXtFzTM6wQ',
        '无痕改正带',
        '22.80',
        2,
        '2021-06-12 17:12:24'
    ), (
        'DXtFzTM6wQ',
        '枕头',
        '18.80',
        1,
        '2021-06-12 17:18:10'
    ), (
        'DXtFzTM6wQ',
        '蓝月亮洗衣液2+1',
        '79.50',
        1,
        '2021-06-12 17:18:10'
    );

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE
    `user` (
        `user_id` varchar(10) NOT NULL COMMENT '用户ID',
        `username` varchar(50) DEFAULT NULL COMMENT '用户名',
        `password` varchar(20) NOT NULL COMMENT '用户密码',
        `mobile_phone` varchar(13) DEFAULT NULL COMMENT '手机号',
        `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
        `head_image` mediumblob COMMENT '头像',
        `realname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
        `idnumber` char(18) DEFAULT NULL COMMENT '身份证号',
        `gender` varchar(4) DEFAULT NULL COMMENT '性别',
        `birthday` date DEFAULT NULL COMMENT '生日',
        `address` varchar(200) DEFAULT NULL COMMENT '地址',
        PRIMARY KEY (`user_id`),
        UNIQUE KEY `mobile_phone` (`mobile_phone`),
        UNIQUE KEY `email` (`email`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*Data for the table `user` */

insert into
    `user`(
        `user_id`,
        `username`,
        `password`,
        `mobile_phone`,
        `email`,
        `head_image`,
        `realname`,
        `idnumber`,
        `gender`,
        `birthday`,
        `address`
    )
values (
        'DXtFzTM6wQ',
        'yfux',
        'lll123456',
        '15310108138',
        '1653727226@qq.com',
        NULL,
        'LY',
        '500384200102287013',
        '女',
        '2001-02-28',
        '广州市花都区迎宾大道西30号'
    );

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;