include("../Data/Script/Common/include.lua")
include("../Data/Script/game_hall.lua")
--游戏、商城、活动、装备

local BTN_RETURN = nil
local BTN_RETURNHIDE = nil
local bgImg = nil
local bgDowmImg = nil

local btn_webSite = nil
local btn_game = nil
local btn_equip = nil
local btn_hero = nil
local btn_shop = nil
local btn_Lv2D = nil
local btn_OB = nil

-- 排队等待相关UI
local img_WaitTimeBg = nil	-- 排队等待背景
local btn_CloseWait = nil	-- 取消等待按钮
local img_TimerRRight = nil	-- 时间
local img_TimerRLeft = nil
local img_TimerLRight = nil
local img_TimerLLeft = nil
local count = 0
local second = 0
local secondL = 0
local minute = 0
local minuteL = 0
local isMathing = 0
local pipei_1 = nil
local pipei_2 = nil
local isPlay = 0
local pipei_zhizhen = nil
local Play_Enabled_Image = nil
local math_type = -1

local btn_BK = nil
local btn_posx = {20,110,200,290}



--目标、活动、邮件、头像、在线人数、金币钻石

local btn_newserver = nil
local btn_sevenday = nil
local btn_growup = nil
local btn_active = nil
local btn_mail = nil
local Btn_turn = nil
local btn_AddMoney = nil
local btn_firstpay = nil
local btn_active_get = nil

-- 左下角----绑定账号、切换原画、默认背景、英雄详情、时钟塔
local btn_BindAccount = nil
local btn_ImageChange = nil
local btn_DefaultBK = nil
local btn_HeroDetail = nil
local btn_TimeTower = nil
local TimeTower = nil

local btn_headPicImg = nil
local wnd_Credit,img_Credit = nil

local show_money = nil
local show_gold = nil
local show_onlinepeople = nil

-----等级、未读邮件、金币钻石、在线人数-----全局变量（便于其他界面操作是否显示）
local player_level = nil
local player_level2 = nil
local player_level_bg = nil
local player_mail = nil
local player_friend = nil
local btn_mailNum,btn_friendNum = nil
local friendInfomationPromot = nil
local Money_Img = {}
local Gold_Img = {}
local online_Img = {}
local max_money = 0
local max_gold = 0
local max_online = 0
local pipeiL_bg = nil
local pipeiR_bg = nil

local forbidden = nil
local forbidden_pic = path.."punish1_hall.BMP"



-----签到任务、首充大礼
local btn_signtask = nil

local btn_friend = nil

local Btn_min = nil
local Btn_close = nil
local Btn_setup = nil


local activity_Effect = nil

local Effect_step = {"idle","end"} 
local timeRemaind = 0

local GiftpicBTn = nil
local onlineEffect = nil
local buttonEffect = {}

local wnd_chat = nil
local btn_chat = nil
local img_chat = nil
local img_chat_unread = nil

local SUMMONERBK = nil
local UpdateWnd,UpdateSupriseWnd,UpdateShopSkinWnd = nil
local ShopSkinWndLeft,ShopSkinWndRight = nil

local scissorwndHero,scissorwndHeroBG = nil
local scissorwnd,scissorwndBG = nil
local UpdateSuprise,UpdateCEFWeb,UpdateShopSkin = nil



-- 精彩活动UI初始化
local MAX_SUPRISE = 2
local SupriseIndex = 1
local SupriseBG = nil
local SuprisePoint = {}

local SuprisePointSel = nil
local strSuprisePath = {path_lolcommon.."act1.BMP",path_lolcommon.."act2.BMP",path_lolcommon.."act3.BMP",path_lolcommon.."act4.BMP",path_lolcommon.."act5.BMP",path_lolcommon.."act6.BMP"}
local spx = {24*1+389,24*2+389,24*3+389,24*4+389,24*5+389,24*6+389}
local spy = {410,410,410,410,410,410}

-- 折扣商店
-- 左侧英雄名字
local AllShopSkinData = nil
local Hero_Back = {}
local Hero_Head = {}
local Hero_Name = {}
local HeroName_Click = nil
local hero_toggleImg = nil
local hero_togglebtn = nil
local DownManyHero = 0
-- 数据
local HeroNameData = {}
HeroNameData.head = {}
HeroNameData.name = {}
HeroNameData.id = {}

-- 商品列表UI控件
local img_GoodsListBackground = {}	-- 商品背景框
local img_GoodsPic = {}				-- 商品图片
local font_GoodsName = {}			-- 商品名字
local img_GoodsFlag = {}			-- 商品标签(限时/打折)
local img_GoodsPic_frame = {}		-- 框
local selec_goods_fight = {}

local font_GoodsLastTime = {}		-- 限时商品剩余时间
local img_GoodsGold = {}			-- 钻石图片
local font_GoodsGold = {}			-- 钻石文字
local img_GoodsMoney = {}			-- 金钱图片
local font_GoodsMoney = {}			-- 金钱文字
local btn_GoodsBuy = {}				-- 购买按钮
local font_Haved = {}
local font_GoodsBuy = {}			-- 购买按钮文字
local font_GoodsFree = {}			-- 试用按钮文字
local Goods_Anim = {}

local GoodsInfo = {}
GoodsInfo.ItemId = {}				-- 道具id
GoodsInfo.Name = {}					-- 名字
GoodsInfo.Describe = {}				-- 描述
GoodsInfo.Path_1 = {}				-- 路径
GoodsInfo.Path_2 = {}
GoodsInfo.Path_3 = {}
GoodsInfo.IsCanBuy = {}				-- 是否能购买
GoodsInfo.IsCanFree = {}			-- 是否可以试用
GoodsInfo.Tip = {}					-- tip
GoodsInfo.Gold = {}					-- 钻石
GoodsInfo.Money = {}				-- 金币
GoodsInfo.Honour = {}				-- 荣誉
GoodsInfo.Contri = {}				-- 功勋
GoodsInfo.Vip = {}					-- vip积分
GoodsInfo.LastTime = {}				-- 剩余时间
GoodsInfo.Flag = {}					-- 标签
GoodsInfo.BuyText = {}
GoodsInfo.IsSuperSkin = {}
--滚动条
local toggleImg = nil
local togglebtn = nil
local DownMany = 0
local MAXHEROSKIN = 300
local PERLINEDATA = 6



local Team_btn = nil
local PlayerImag = nil

-- 右侧活动
local Updateback,Updatebk = nil
local btn_firstcharge,firstcharge = nil
local NeophyteTutorialBtn,NeophyteTutorialBtn_icon = nil
local OpenCEF,OpenCEFicon = nil
local OldPlayerRegression, OldPlayerRegressionicon= nil
local btn_SevenOnlineGift,btn_SevenOnlineGifticon = nil
local Get4399Mail = nil
local Get4399Mail2 = nil
local btn_FangChenMi4399, btn_FangChenMi4399Icon = nil


function PlayMailEffect()
    activity_Effect:SetVisible(1)
	XPlayEffect(activity_Effect.id,0)
end


local g_up = nil
local g_down = nil
local g_hall = nil

local UI_AllActivity =nil
local ActivityBtn = {}
local iconBtn = {}
local iconFont = {}
local ActivityA = nil
local ActivityEffect = nil
local EffectPath1 = " "--旗帜
local EffectPath2 = " "
local timeCount = 0
local ActivityPath1 = {
path_lolMain.."Chess1.BMP",
path_dv.."Devil1.BMP",
path_Activity.."icon_xiariji.BMP",
path_Bingo.."btn_Enter.BMP",
path_Activity.."sanliji.BMP",
path_dice.."Monopoly1.BMP",
path_SmashEgg.."shamotanbao.BMP",
path_Activity.."4399_1.BMP",
path_card.."yearcard.BMP",
path_card.."present.BMP",
path_sangreal.."CallBack1.BMP",
path_sangreal.."Sangreal1.BMP",
path_turnplate.."TurnPlate1.BMP",
path_ck.."Engrave1.BMP",
path_Activity.."yueka_1.BMP",
path_Activity.."liumangxing_1.BMP",
path_Activity.."tuangou_01.BMP",
path_Activity.."jinliicon_1.BMP",
path_Activity.."4399_2_1.BMP",
path_Activity.."cave1.BMP",
path_Activity.."PinTuan.BMP",
path_lolactivity.."EternalChessboard.BMP",
path_TimiTimeShop.."TimiTimeShopEnterIcon_1.BMP",
path_Activity.."ExchangeShop_1.BMP",
path_Activity.."300Connect1.BMP"}
 
local ActivityPath2 = {
path_lolMain.."Chess2.BMP",
path_dv.."Devil2.BMP",
path_Activity.."icon_xiariji_1.BMP",
path_Bingo.."btn_Enter2.BMP",
path_Activity.."sanliji2.BMP",
path_dice.."Monopoly2.BMP",
path_SmashEgg.."shamotanbao2.BMP",
path_Activity.."4399_2.BMP",
path_card.."yearcard1.BMP",
path_card.."present1.BMP",
path_sangreal.."CallBack2.BMP",
path_sangreal.."Sangreal2.BMP",
path_turnplate.."TurnPlate2.BMP",
path_ck.."Engrave2.BMP",
path_Activity.."yueka_2.BMP",
path_Activity.."liumangxing_2.BMP",
path_Activity.."tuangou_02.BMP",
path_Activity.."jinliicon_2.BMP",
path_Activity.."4399_2_2.BMP",
path_Activity.."cave2.BMP",
path_Activity.."PinTuan.BMP",
path_lolactivity.."EternalChessboard.BMP",
path_TimiTimeShop.."TimiTimeShopEnterIcon_1.BMP",
path_Activity.."ExchangeShop_2.BMP",
path_Activity.."300Connect2.BMP"}
 
local ActivityPath3 = {
path_lolMain.."Chess3.BMP",
path_dv.."Devil3.BMP",
path_Activity.."icon_xiariji_2.BMP",
path_Bingo.."btn_Enter3.BMP",
path_Activity.."sanliji3.BMP",
path_dice.."Monopoly3.BMP",
path_SmashEgg.."shamotanbao3.BMP",
path_Activity.."4399_3.BMP",
path_card.."yearcard2.BMP",
path_card.."present2.BMP",
path_sangreal.."CallBack3.BMP",
path_sangreal.."Sangreal3.BMP",
path_turnplate.."TurnPlate3.BMP",
path_ck.."Engrave3.BMP",
path_Activity.."yueka_3.BMP",
path_Activity.."liumangxing_3.BMP",
path_Activity.."tuangou_03.BMP",
path_Activity.."jinliicon_3.BMP",
path_Activity.."4399_2_3.BMP",
path_Activity.."cave3.BMP",
path_Activity.."PinTuan.BMP",
path_lolactivity.."EternalChessboard.BMP",
path_TimiTimeShop.."TimiTimeShopEnterIcon_3.BMP",
path_Activity.."ExchangeShop_3.BMP",
path_Activity.."300Connect3.BMP"}


local ActivityEntery = {0,21,12}

-- 时钟塔修行界面
local TimeTowerWnd 		= nil
local TimeTowerLogo 	= nil	-- 分类，基础修行还是高阶修行
local TimeTowerLevel 	= nil	-- 学阶等级
local TimeTowerStarBK  	= {}	-- 修行进度
local TimeTowerStar  	= {}	-- 修行进度
local TimeTowerStarFont = nil	-- 进度文字
local TimeTowerTaskBtn = nil	-- 日常任务按钮

local TimeTowerTaskWnd 	= nil	-- 每日修行任务
local MaxTimeTowerTask = 2
local Task_toggleBK = nil
local Task_toggleBtn = nil
local TaskupdownCount = 0
local TaskmaxUpdown = 0

local Task = {}
Task.Back = {}
Task.Title = {}
Task.Value = {}
Task.MaxValue = {}
Task.Score = {}
Task.ScoreWord = {}

local TaskInfo = {}
TaskInfo.ID = {}
TaskInfo.Title = {}
TaskInfo.Value = {}
TaskInfo.MaxValue = {}
TaskInfo.Score = {}
local TimeTowerSingleLvMax = 0

local bIs4399 = false

local btnChess = nil	--自走棋入口




function InitGame_FourpartUI(wnd,bVisible)
	g_shop_hero_equip_ui = CreateWindow(wnd.id, 0, 0, 1280, 50)
	Init_MenuListpart(g_shop_hero_equip_ui)
	Init_MenuMailpart(g_shop_hero_equip_ui)
	g_shop_hero_equip_ui:SetVisible(bVisible)
end

function SetPlayerImagVisible(ibool)
    PlayerImag:SetVisible(ibool)
end

function Init_UI_AllActivity(wnd)--旗帜按键
    UI_AllActivity = CreateWindow(wnd.id,0,0,176,443)
	UI_AllActivity:SetVisible(0)
	ActivityEffect = UI_AllActivity:AddEffect(" ")
	ActivityEffect:SetVisible(0)
	for i=1,3 do
	    ActivityBtn[i] = UI_AllActivity:AddImage(path_lolMain.."ActivityBK.BMP",180+(i-1)*90,52,40,40)
		iconBtn[i] = ActivityBtn[i]:AddButton(ActivityPath1[i],ActivityPath2[i],ActivityPath3[i],0,0,40,40)
		iconFont[i] = ActivityBtn[i]:AddFont("",12,8,0,-23,74,75,0xffffff)
		iconBtn[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			
			XReqTriggerActivity(ActivityEntery[i])
		end
	end
	ActivityA = UI_AllActivity:AddButton(path_lolMain.."A_1.BMP",path_lolMain.."A_2.BMP",path_lolMain.."A_3.BMP",3000,420,33,26)
    ActivityA.script[XE_LBUP] = function()
	    close_AllActivityVisible()
	end
	
	-- btnChess = UI_AllActivity:AddButton(path_lolMain.."Chess1.bmp",path_lolMain.."Chess2.bmp",path_lolMain.."Chess3.bmp",55,144,71,71)
	-- btnChess:SetVisible(0)
	-- btnChess.script[XE_LBUP] = function()
		-- XOpenChess()
	-- end
	
	Get4399Mail = UI_AllActivity:AddButton(path_Activity.."4399_2_1.BMP",path_Activity.."4399_2_2.BMP",path_Activity.."4399_2_3.BMP",49,444,90,90)
    Get4399Mail.script[XE_LBUP] = function()
	    XClickPlaySound(UI_click_new)
		
		XGetFirstMail(1)
	end
	
	Get4399Mail2 = UI_AllActivity:AddButton(path_Activity.."4399_1.BMP",path_Activity.."4399_2.BMP",path_Activity.."4399_3.BMP",49,540,90,90)
    Get4399Mail2.script[XE_LBUP] = function()
	    XClickPlaySound(UI_click_new)
		
		XGetFirstMail(0)
	end
	
end

function ActivityEnteryListID(i,ID)
	log("\nActivityEnteryListID  i = "..i.." ;ID = "..ID)
	ActivityEntery[i] = ID
	XChangeImage(iconBtn[i].id, ActivityPath1[ID+1], Wnd_Button,0)
	XChangeImage(iconBtn[i].id, ActivityPath2[ID+1], Wnd_Button,1)
	XChangeImage(iconBtn[i].id, ActivityPath3[ID+1], Wnd_Button,2)
end

function SetActivityinfoVisible(i,iBool)
	ActivityBtn[i]:SetVisible(iBool)
end

function SetAllActivityinfoTransparent(alpha)
	if alpha>1 then
	    alpha = 1
	end
	for i=1,3 do
	    ActivityBtn[i]:SetTransparent(alpha)
		iconFont[i]:SetTransparent(alpha)
	end
	ActivityA:SetTransparent(alpha)
	Get4399Mail:SetTransparent(alpha)
	Get4399Mail2:SetTransparent(alpha)
end

function close_AllActivityVisible()
    if UI_AllActivity:IsVisible() == true then
		timeCount = 0
		SetAllActivityinfoVisible(0)
		UI_AllActivity:SetTimer(0,50,800).Timer = function(timer,interval)
			timeCount = 50 + timeCount
			if timeCount>700 then
				SetAllActivityinfoTransparent(0)
				ActivityEffect:ChangeEffect(EffectPath2)
				XPlayEffect(ActivityEffect.id,0)
				UI_AllActivity:KillTimer(timer)
			elseif timeCount<=700 then
				SetAllActivityinfoTransparent((700-timeCount)/1200)
			end
		end
	end
end
function SetAllActivityinfoVisible(iBool)
	for i=1,3 do
	    iconBtn[i]:SetTouchEnabled(iBool)
	end
	ActivityA:SetTouchEnabled(iBool)
end

function SetBingo_ActivityTimeRange(stime)
	-- iconFont[3]:SetFontText(stime,0xffffff)
end

function SetUI_AllActivityVisible(flag)
    if UI_AllActivity:IsVisible() == false and flag == 1 then
	    ActivityEffect:ChangeEffect(EffectPath1)
        XPlayEffect(ActivityEffect.id,0)
		XClickPlaySound(UI_flag2_new)
		UI_AllActivity:SetVisible(1)
		g_hall:SetVisible(1)
		timeCount = 0
		SetAllActivityinfoVisible(1)
		SetAllActivityinfoTransparent(0)
		UI_AllActivity:SetTimer(0,50,1250).Timer = function(timer,interval)
			timeCount = 50 + timeCount
			if timeCount>1200 then
				SetAllActivityinfoTransparent(1)
				UI_AllActivity:KillTimer(timer)
			elseif timeCount>=700 then
				SetAllActivityinfoTransparent((timeCount-700)/1200)
			end
		end
	elseif  UI_AllActivity:IsVisible() == true and  flag == 0 then
	    UI_AllActivity:SetVisible(0)
		g_hall:SetVisible(0)
	end
end


function Init_MenuListpart(wnd)
	g_up = CreateWindow(wnd.id, 0, 0, 1280, 50)
	g_hall = CreateWindow(wnd.id, 0, 0, 1280, 50)
	g_down = CreateWindow(wnd.id, 0, 0, 1280, 50)
	-- 时钟塔修行界面
	TimeTowerWnd = g_hall:AddImage(path_loltimertower.." ",1100,10,1,1)
	SUMMONERBK = g_up:AddImage(path_lolplayerinfo.."summonerskillBK2.BMP", 309, 34, 662, 51)
	pipeiL_bg = g_up:AddImage(path_lolMain.."di_01.BMP", 517, 0, 130, 167)
	pipeiL_bg:SetTransparent(0)
	pipeiL_bg:SetVisible(0)
	pipeiR_bg = g_up:AddImage(path_lolMain.."di_02.BMP", 647, 0, 130, 167)
	pipeiR_bg:SetTransparent(0)
	pipeiR_bg:SetVisible(0)
	
	pipei_1 = g_up:AddEffect("..\\Data\\Magic\\Common\\UI\\changwai\\pipei\\tx_UI_CW_pipei_01.x", 646, 50, 1280, 800)
	pipei_1:SetTouchEnabled(0)
	pipei_1:SetVisible(0)
	pipei_zhizhen = g_up:AddImage(path_lolMain.."zhizhen.BMP", 630, 30, 32, 130)
	pipei_zhizhen:SetVisible(0)
	pipei_zhizhen:SetTouchEnabled(0)
	
	--上边栏
	bgImg = g_up:AddImage(path_lolMain.."shangbiankuang.BMP",0,0,1280,800)
	bgImg.setrotation(math.pi)
	bgImg:SetTouchEnabled(0)
	
	bgDowmImg = g_up:AddImage(path_lolMain.."upBK_hall.BMP",3000,746,1280,54)
	bgDowmImg:SetTouchEnabled(0)
	local bgLeftImg = bgImg:AddImage(path_lolMain.."leftIImg.BMP",3000,0,123,78)--左上
	bgLeftImg:SetTouchEnabled(0)
	btn_headPicImg = bgImg:AddRhombus(path_equip.."bag_equip.BMP",7,8,78,78)--头像
	btn_headPicImg:SetSegment(64)
	btn_headPicImg:SetTextTip("查看个人信息")
	
	local bgRightimg = bgImg:AddImage(path_lolMain.."RightImg.BMP",6,6,89,85)--右上
	bgRightimg:SetTouchEnabled(0)
	local bgLeftDownImg = g_up:AddImage(path_lolMain.."LeftDown.BMP",3000,722,123,78)--左下
	bgLeftDownImg:SetTouchEnabled(0)
	local bgRightDownImg = g_up:AddImage(path_lolMain.."RightDown.BMP",3000,722,123,78)--右下
	bgRightDownImg:SetTouchEnabled(0)
	wnd_Credit = CreateWindow(bgRightimg.id, 12, 62, 24, 24)
	img_Credit = wnd_Credit:AddImage(path_lolMain.."Credit.BMP",0,0,24,24)
	
	Init_UI_AllActivity(bgImg)
	
	BTN_RETURNHIDE = g_up:AddImage(path_lolMain.."300logo_hide.BMP", 1136, 0, 218, 96)	
	btn_webSite = g_up:AddButton(path_lolMain.."300logo_hall_1.BMP",path_lolMain.."300logo1_hall_1.BMP",path_lolMain.."300logo2_hall_1.BMP",1067,9,204,36)
	XWindowEnableAlphaTouch(btn_webSite.id,1)
	btn_webSite:SetTextTip("返回大厅")
	btn_webSite.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		ReturnToMenuList(0)
	end
	btn_webSite.script[XE_ONHOVER] = function()
     	XClickPlaySound(UI_select_300logo_new)
	end
	
	--头像边框
	player_level_bg = g_up:AddImage(path.."level.BMP",65,62,27,26)
	
	InitGameTeamFight_ui(wnd, 0)					-- 组对界面在基本3中界面上层		
	--上面一行
	--游戏
	btn_game = g_up:AddNewCheckButton(path_lolMain.."game1_hall.BMP",path_lolMain.."game2_hall.BMP",path_lolMain.."game3_hall.BMP",590,12,113,34)
	PlayerImag = btn_game:AddImage(path_lolMain.." ",90,28,60,20)
	PlayerImag:SetTouchEnabled(0)
	pipei_2 = g_up:AddEffect(" ", 646, 45, 1280, 800)
	pipei_2:SetTouchEnabled(0)
	pipei_2:SetVisible(0)
	XWindowEnableAlphaTouch(btn_game.id,1)
	
	Play_Enabled_Image = g_up:AddImage(path_lolhero.."play_red.BMP",590,12,113,34)
	Play_Enabled_Image:SetVisible(0)
	XWindowEnableAlphaTouch(Play_Enabled_Image.id,1)
	
	-- 点击
	btn_game.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if  g_GameTeamFight_ui:IsVisible() == false then
		    ReturnToMenuList(1)
		else
		    XShowMessageBoxFormLua( "您在组队中！")
		end
	end
	pipeiL_bg.script[XE_LBUP] = function()
		if  g_GameTeamFight_ui:IsVisible() == false then
			if isMathing == 0 then
				math_type = 0
				isPlay = 0
				pipeiL_bg:SetVisible(0)
				pipeiR_bg:SetVisible(0)
				XPlayEffectByName(pipei_1.id, "dead_3", 0)
				XClickStopSound(UI_select_play_loop_new)
				XClickPlaySound(UI_click_jingji_zhanchang_new)
				XStartCrossServerGame(0)
			end
		else
		    XShowMessageBoxFormLua( "您在组队中！")
		end
	end
	pipeiR_bg.script[XE_LBUP] = function()
		if  g_GameTeamFight_ui:IsVisible() == false then
			if isMathing == 0 then
				math_type = 1
				isPlay = 0
				pipeiL_bg:SetVisible(0)
				pipeiR_bg:SetVisible(0)
				XPlayEffectByName(pipei_1.id, "dead_2", 0)
				XClickStopSound(UI_select_play_loop_new)
				XClickPlaySound(UI_click_jingji_zhanchang_new)
				XGameStartOneHeroGame(1)
			end
		else
		    XShowMessageBoxFormLua( "您在组队中！")
		end
	end
	
	pipeiL_bg.script[XE_ONHOVER] = function()
		if isMathing == 0 and isPlay == 1 then
			XPlayEffectByName(pipei_1.id, "idle_1_2", 0)
			XClickPlaySound(UI_index_new)
		end
	end
	pipeiR_bg.script[XE_ONHOVER] = function()
		if isMathing == 0 and isPlay == 1 then
			XPlayEffectByName(pipei_1.id, "idle_1_1", 0)
			XClickPlaySound(UI_index_new)
		end
	end
	
	-- 离开
	pipeiL_bg.script[XE_ONUNHOVER] = function()
		-- if isMathing == 0 then
			-- XPlayEffectByName(pipei_1.id, "dead_1", 0)
			-- pipeiL_bg:SetVisible(0)
			-- pipeiR_bg:SetVisible(0)
		-- end
	end
	pipeiR_bg.script[XE_ONUNHOVER] = function()
		-- if isMathing == 0 then
			-- XPlayEffectByName(pipei_1.id, "dead_1", 0)
			-- pipeiL_bg:SetVisible(0)
			-- pipeiR_bg:SetVisible(0)
		-- end
	end
	
	--装备
	btn_equip = g_up:AddNewCheckButton(path_lolMain.."equip1_hall.BMP",path_lolMain.."equip2_hall.BMP",path_lolMain.."choosezhuangbei.BMP",730,12,113,34)
	buttonEffect[1] = g_up:AddEffect(" ",3000,13,1280,800,100)
	buttonEffect[1]:SetVisible(0)
	buttonEffect[1]:SetTouchEnabled(0)
	btn_equip.script[XE_LBUP] = function()

		XClickPlaySound(UI_click2_new)
		ReturnToMenuList(2)
		if NewTutotialMissionType == "强化一次装备" or NewTutotialMissionType == "使用一次合成功能" or NewTutotialMissionType == "使用一次宝石合成功能" or NewTutotialMissionType == "镶嵌一颗宝石至装备" then
			NewTutorialStep = NewTutorialStep + 1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		elseif NewTutotialMissionType == "打开装备界面" then
			NewTutorialStep = -1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		end
	end
	btn_equip.script[XE_LBDOWN] = function()
	    buttonEffect[1]:ChangeEffect("")	
        buttonEffect[1]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")		
	    buttonEffect[1]:SetVisible(1)
		XPlayEffect(buttonEffect[1].id,0)	
	end
	btn_equip.script[XE_ONHOVER] = function()
	    XClickPlaySound(UI_select2_new)
		XPlayMatchingDeadEffect()
	end
	--英雄
	btn_hero = g_up:AddNewCheckButton(path_lolMain.."hero1_hall.BMP",path_lolMain.."hero2_hall.BMP",path_lolMain.."choosejikashu.BMP",450,12,113,34)
	buttonEffect[2] = g_up:AddEffect(" ",3000,13,1280,800,100)
	buttonEffect[2]:SetVisible(0)
	buttonEffect[2]:SetTouchEnabled(0)
	btn_hero.script[XE_LBDOWN] = function()
	    buttonEffect[2]:ChangeEffect("")	
        buttonEffect[2]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")		
	    buttonEffect[2]:SetVisible(1)
		XPlayEffect(buttonEffect[2].id,0)	
	end
	btn_hero.script[XE_LBUP] = function()
	
		XClickPlaySound(UI_click2_new)
		
		if g_game_heroDetail_ui:IsVisible() == false then
			ReturnToMenuList(3)
		else
			TriggerHeroDetailReturn()
		end
	
		if NewTutotialMissionType == "使一个英雄进行觉醒" then
			NewTutorialStep = NewTutorialStep + 1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		end
	end
	btn_hero.script[XE_ONHOVER] = function()
	    XClickPlaySound(UI_select2_new)
		XPlayMatchingDeadEffect()
	end
	--商城
	btn_shop = g_up:AddNewCheckButton(path_lolMain.."shangcheng1_hall.BMP",path_lolMain.."shangcheng2_hall.BMP",path_lolMain.."chooseshangcheng.BMP",870,12,113,34)
	buttonEffect[3] = g_up:AddEffect(" ",3000,42,1280,800,100)
	buttonEffect[3]:SetVisible(0)
	buttonEffect[3]:SetTouchEnabled(0)
	btn_shop.script[XE_LBDOWN] = function()
		buttonEffect[3]:ChangeEffect("")	
		buttonEffect[3]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")			
		buttonEffect[3]:SetVisible(1)
		XPlayEffect(buttonEffect[3].id,0)

	end
	btn_shop.script[XE_LBUP] = function()
		XClickPlaySound(UI_click2_new)
		ReturnToMenuList(4)
		if NewTutotialMissionType == "在商城中购买一次道具" then
			NewTutorialStep = -1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		elseif NewTutotialMissionType == "获得一颗宝石" then
			NewTutorialStep = NewTutorialStep + 1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		end
	end
	btn_shop.script[XE_ONHOVER] = function()
		XClickPlaySound(UI_select2_new)
	end
	--签到任务
	btn_signtask = g_up:AddNewCheckButton(path_lolMain.."signtask1_hall.BMP",path_lolMain.."signtask2_hall.BMP",path_lolMain.."chooserichang.BMP",170,12,113,34)
	buttonEffect[4] = g_up:AddEffect(" ",3000,42,1280,800,100)
	buttonEffect[4]:SetVisible(0)
	buttonEffect[4]:SetTouchEnabled(0)
	btn_signtask.script[XE_LBUP] = function()
		XClickPlaySound(UI_click2_new)
		ReturnToMenuList(6)
		RequestTaskData()
	end	
	btn_signtask.script[XE_LBDOWN] = function()
	    buttonEffect[4]:ChangeEffect("")	
        buttonEffect[4]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")		
	    buttonEffect[4]:SetVisible(1)
		XPlayEffect(buttonEffect[4].id,0)	
	end
	btn_signtask.script[XE_ONHOVER] = function()
	    XClickPlaySound(UI_select2_new)
	end
	
	--活动
	btn_active = g_up:AddNewCheckButton(path_lolMain.."Activity_1.BMP",path_lolMain.."Activity_2.BMP",path_lolMain.."choosehuodong.BMP",310,12,113,34)
	btn_active_get = btn_active:AddImage(path.."friendMes_hall.BMP",90,-3,19,20)
	btn_active_get:SetTextTip("有奖励待领取！")
	btn_active_get:SetVisible(0)
	buttonEffect[5] = g_up:AddEffect(" ",3000,42,1280,800,100)
	buttonEffect[5]:SetVisible(0)
	buttonEffect[5]:SetTouchEnabled(0)
	btn_active.script[XE_LBUP] = function()
		XClickPlaySound(UI_click2_new)
		ReturnToMenuList(12)
		activity_Effect:SetVisible(0)
	end
	btn_active.script[XE_LBDOWN] = function()
	    buttonEffect[5]:ChangeEffect("")	
        buttonEffect[5]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")	
	    buttonEffect[5]:SetVisible(1)
		XPlayEffect(buttonEffect[5].id,0)	
	end
	btn_active.script[XE_ONHOVER] = function()
	    XClickPlaySound(UI_select2_new)
	end
	
	
	
	-- 邮件
	btn_mail = g_up:AddButton(path_lolMain.."money_add.BMP",path_lolMain.."money2_add.BMP",path_lolMain.."money3_add.BMP",63,730-OffsetY1,69,70)
	buttonEffect[6] = g_up:AddEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x",3000,42,1280,800,100)
	buttonEffect[6]:SetVisible(0)
	buttonEffect[6]:SetTouchEnabled(0)
	btn_mailNum = btn_mail:AddImage(path_lolMain.."numBack.BMP",36,41,29,18)
	player_mail = btn_mailNum:AddFont("", 12, 8, 0, 0, 29, 18, 0xfff4f4c1)
	btn_mail.script[XE_LBUP] = function()
		XClickPlaySound(UI_click2_new)
		ReturnToMenuList(8)
	end
	btn_mail.script[XE_LBDOWN] = function()
	    buttonEffect[6]:ChangeEffect("")	
        buttonEffect[6]:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\UI_dianji\\tx_UI_CW_dianji_01.x")	
	    buttonEffect[6]:SetVisible(1)
		XPlayEffect(buttonEffect[6].id,0)	
	end
	btn_mail.script[XE_ONHOVER] = function()
	    XClickPlaySound(UI_select2_new)
	end
	
	--计时器
	
	--好友
	btn_friend = g_up:AddButton(path_lolMain.."CircleButton.BMP",path_lolMain.."CircleButton.BMP",path_lolMain.."CircleButton.BMP",0,730-OffsetY1,69,70)
	local ff = btn_friend:AddImage(path_lolMain.."friendicon.BMP",13,19,42,32)
	ff:SetTouchEnabled(0)
	btn_friend.script[XE_LBUP] = function()
		XClickPlaySound(UI_upspring_new)
		ReturnToMenuList(7)
	end
	
	Team_btn = g_up:AddButton(path_lolMain.."croci.BMP",path_lolMain.."croci.BMP",path_lolMain.."croci.BMP",0,730-OffsetY1,69,70)
	Team_btn:SetVisible(0)
	Team_btn.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		SetGameTeamFightPosition(0,175-OffsetY1)
		SetTalkIsVisible(1)
		Team_btn:SetVisible(0)
	end
	
	btn_friendNum = g_up:AddImage(path_lolMain.."numBack.BMP",30,771-OffsetY1,29,18)
	btn_friendNum:SetTouchEnabled(0)
	player_friend = btn_friendNum:AddFont("0", 12, 8, 0, 0, 29, 18, 0xf4f4c1)
	
	
	--邮件
	-- btn_mail = g_up:AddNewCheckButton(path_lolMain.."mail.BMP",path_lolMain.."mail.BMP",path_lolMain.."mail.BMP",1115,0,68,46)
	-- btn_mailNum = btn_mail:AddImage(path_lolMain.."numBack.BMP",39,29,29,18)
	-- btn_mail.script[XE_LBUP] = function()
		-- XClickPlaySound(UI_click_new)
		-- ReturnToMenuList(8)
	-- end
	-- player_mail = btn_mailNum:AddFont("0", 12, 8, 0, 0, 29, 18, 0xf4f4c1)
	
	
	-- 聊天
	wnd_chat = CreateChatWindow(g_down)
	btn_chat = g_down:AddButton(path.."CircleButton.BMP",path.."CircleButton.BMP",path.."CircleButton.BMP",1218,730-OffsetY1,69,70)
	
	img_chat = btn_chat:AddImage(path_lolMain.."chaticon.bmp",22,23,26,24)
	img_chat:SetTouchEnabled(0)
	
	img_chat_unread = btn_chat:AddImage(path_lolMain.."chat/chatUnread.bmp",25,-5,19,20)
	img_chat_unread:SetTouchEnabled(0)
	img_chat_unread:SetVisible(0)
	
	btn_chat.script[XE_LBUP] = function()
		XClickPlaySound(UI_upspring_new)
		wnd_chat.RevertAdvChat()		     
	end
	SwitchChatIcon(0)
	
	-----------------------------------------------------------------------------------------------------------------------------------------
	
	btn_OB = g_up:AddNewCheckButton(path.."ob1_hall.BMP",path.."ob2_hall.BMP",path.."ob3_hall.BMP",505,0,82,51)
	btn_OB:SetVisible(0)
	
	btn_OB.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		ReturnToMenuList(11)
	end
	
	
	
	
	-- 等待排队
	img_WaitTimeBg = g_up:AddImage(path.."waitTimeBK_hall.BMP",0,0,490,120)
	img_WaitTimeBg:SetVisible(0)
	img_WaitTimeBg:SetTouchEnabled(0)
	img_WaitTimeBg:SetTransparent(0)
	
	btn_CloseWait = img_WaitTimeBg:AddButton(path_lolcommon.."clane.BMP",path_lolcommon.."clane1.BMP",path_lolcommon.."clane2.BMP",625,63,43,26)
	
	btn_CloseWait.script[XE_LBUP] = function()
		XCloseWait()
	end
	
	img_WaitTimeBg:AddImage(path_lolcommon.."..BMP", 640, 18, 15, 21)
	
	img_TimerRRight = img_WaitTimeBg:AddImage(path_lolcommon.."0.BMP", 668, 18, 15, 21)
	img_TimerRLeft = img_WaitTimeBg:AddImage(path_lolcommon.."0.BMP", 653, 18, 15, 21)
	img_TimerLRight = img_WaitTimeBg:AddImage(path_lolcommon.."0.BMP", 627, 18, 15, 21)
	img_TimerLLeft = img_WaitTimeBg:AddImage(path_lolcommon.."0.BMP", 612, 18, 15, 21)
	
	--上边栏	
	BTN_RETURN = g_up:AddButton(path_lolMain.."300logo_hall.BMP",path_lolMain.."300logo1_hall.BMP",path_lolMain.."300logo2_hall.BMP",-5,3,192,105)
	BTN_RETURN:SetTextTip("返回大厅")
	BTN_RETURN.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		ReturnToMenuList(0)
	end
	
	BTN_RETURN.script[XE_ONHOVER] = function()
     	XClickPlaySound(UI_select_300logo_new)
	end	
	
	
	-- 充值
	btn_AddMoney = g_down:AddButton(path_lolMain.."AddMoney.BMP", path_lolMain.."AddMoney1.BMP", path_lolMain.."AddMoney2.BMP", 1280/2-145/2, 767, 145, 33)
	btn_AddMoney:SetVisible(0)
	btn_AddMoney.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XGameSigninToAddMoney()
	end
	
end

function SwitchChatIcon(t)
	if t == 0 then
		img_chat:SetVisible(0)
		XChangeImage(btn_chat.id, path_lolMain.."chat/chatDownArrow.BMP", Wnd_Button,0)
		XChangeImage(btn_chat.id, path_lolMain.."chat/chatDownArrow2.BMP", Wnd_Button,1)
		XChangeImage(btn_chat.id, path_lolMain.."chat/chatDownArrow3.BMP", Wnd_Button,2)
		
		SetUnreadMsgIcon(0)
	elseif t == 1 then
		img_chat:SetVisible(1)
		XChangeImage(btn_chat.id, path.."CircleButton.BMP", Wnd_Button,0)
		XChangeImage(btn_chat.id, path.."CircleButton.BMP", Wnd_Button,1)
		XChangeImage(btn_chat.id, path.."CircleButton.BMP", Wnd_Button,2)
	end
end

function SetUnreadMsgIcon(t)
	if t == 0 then
		img_chat_unread:SetVisible(0)
	else
		img_chat_unread:SetVisible(1)
	end
end

-- 设置充值按钮是否显示
function SetAddMoneyButtonVisible(visible)
	btn_AddMoney:SetVisible(visible)
end

function SetTeam_BtnVisible(ibool)
    Team_btn:SetVisible(ibool)
end

function SetCEFButtonVisible(ibool)
     OpenCEF:SetVisible(ibool)
end

function Init_MenuMailpart(wnd)	
	--反馈
	Updateback = g_up:AddImage(path_lolMain.." ",1046,7,1,1)
	Updatebk = Updateback:AddButton(path_lolMain.."FA1.BMP",path_lolMain.."FA2.BMP",path_lolMain.."FA3.BMP",-16,3,25,36)
	Updatebk.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		SetUpdateWndIsVisible(1)
	end
	
	

	
	--首充奖励
	btn_firstcharge = g_up:AddImage(path_lolMain .. "LeftSmallBtn.BMP", 1238,145,42,105)
	firstcharge = btn_firstcharge:AddButton(path_lolMain.."FC1.BMP",path_lolMain.."FC2.BMP",path_lolMain.."FC3.BMP",-6,10,51,41)
	firstcharge.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		ReturnToMenuList(9)
		Set_JumpToFirstCharge()
	end
	
	-- 新手任务
	NeophyteTutorialBtn = g_up:AddImage(path_lolMain .. "LeftSmallBtn.BMP", 1238,194,42,105)
	NeophyteTutorialBtn_icon = NeophyteTutorialBtn:AddButton(path_lolMain.."FP1.BMP",path_lolMain.."FP2.BMP",path_lolMain.."FP3.BMP",-6,10,51,41)
	NeophyteTutorialBtn_icon.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		XNeedNeophyteTutorialTaskInfo(1)
		CheckTaskButtonState(1)
	end

	
	OldPlayerRegression = g_up:AddImage(path_lolMain .. "LeftSmallBtn.BMP", 1238,243,42,105)
	OldPlayerRegressionicon = OldPlayerRegression:AddButton(path_lolMain.."getback1.BMP",path_lolMain.."getback2.BMP",path_lolMain.."getback3.BMP",-6,10,51,41)
	OldPlayerRegressionicon.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
	
	    XNeedNeophyteTutorialTaskInfo(2)
		CheckTaskButtonState(2)
	end
	
	btn_SevenOnlineGift = g_up:AddImage(path_lolMain .. "LeftSmallBtn.BMP", 1238,292,42,105)
	btn_SevenOnlineGifticon = btn_SevenOnlineGift:AddButton(path_lolMain.."xshl1.BMP",path_lolMain.."xshl2.BMP",path_lolMain.."xshl3.BMP", -6,10,51,41)
	btn_SevenOnlineGifticon.script[XE_LBUP] = function()
	    XClickPlaySound(UI_click_new)
		
		XSetSevenOnlineGiftVisible(1)
	end

	--onlineEffect = g_up:AddEffect("..\\Data\\Magic\\Common\\UI\\changwai\\zaixianjiangli\\tx_UI_CW_zaixianjiangli_01.x",969,26,1280,800)
	--onlineEffect:SetTouchEnabled(0)
	--onlineEffect:SetVisible(0)

	
	--绑定账号
	btn_BindAccount = g_hall:AddImage(path_lolMain.." ",3000,764,83,36)
	local personal = btn_BindAccount:AddButton(path_lolMain.."bind1.BMP",path_lolMain.."bind2.BMP",path_lolMain.."bind3.BMP",3000,11,24,24)
	personal.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		--
		ReturnToMenuList(5)	
	end

	btn_ImageChange = g_hall:AddImage(path_lolMain.." ",3000,764,83,36)
	btn_ImageChange:SetVisible(0)
	local changecg = btn_ImageChange:AddButton(path_lolMain.."changecg1.BMP",path_lolMain.."changecg2.BMP",path_lolMain.."changecg3.BMP",3000,11,24,24)
	changecg.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		ChangeHeroCG()
	end
	
	btn_DefaultBK = g_hall:AddImage(path_lolMain.." ",3000,764,83,36)
	btn_DefaultBK:SetVisible(0)
	local DefaultBK = btn_DefaultBK:AddButton(path_lolMain.."deafultbk1.BMP",path_lolMain.."deafultbk2.BMP",path_lolMain.."deafultbk3.BMP",3000,8,25,28)
	DefaultBK.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		Reset_DefaultBK()
	end
	
	btn_HeroDetail = g_hall:AddImage(path_lolMain.." ",3000,764,83,36)
	btn_HeroDetail:SetVisible(0)
	local HeroDetail = btn_HeroDetail:AddButton(path_lolMain.."herodetail1.BMP",path_lolMain.."herodetail2.BMP",path_lolMain.."herodetail3.BMP",3000,8,26,28)
	HeroDetail.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		Set_JumpToHeroDetail()
	end
	
	btn_TimeTower = g_hall:AddImage(path_lolMain.." ",3000,764,83,36)
	btn_TimeTower:SetVisible(0)
	TimeTower = btn_TimeTower:AddButton(path_lolMain.."TimeTower1.BMP",path_lolMain.."TimeTower2.BMP",path_lolMain.."TimeTower3.BMP",3000,9,28,27)
	TimeTower.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		TimeTowerWnd:SetVisible(1)
	end
	
	-- 4399防沉迷
	btn_FangChenMi4399 = g_hall:AddImage(path_lolMain.." ", 3000, 764, 83, 36)
	btn_FangChenMi4399:SetVisible(0)
	btn_FangChenMi4399Icon = btn_FangChenMi4399:AddButton(path_lolMain.."fangchenmi1.BMP",path_lolMain.."fangchenmi2.BMP",path_lolMain.."fangchenmi3.BMP",3000,8,25,28)
	btn_FangChenMi4399Icon.script[XE_LBUP] = function()
	    XClickPlaySound(UI_click_new)
		Set_4399_AntiAddiction_Wnd_Visible(1)
	end
	
	XBindNewCheckButton(btn_game.id,btn_equip.id,btn_hero.id,btn_shop.id,btn_active.id,btn_signtask.id,btn_OB.id)
	
	OpenCEF = g_hall:AddButton(path_lolMain .. " ",path_lolMain .. " ",path_lolMain .. " ", 3000,764,83,36)
	OpenCEF.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
	
	    XOpenCefButton(3000,0,100,1235,610)
	end
	
	
	


	

	
	btn_headPicImg.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		ReturnToMenuList(9)
		if NewTutotialMissionType == "点选一次天赋" then
			NewTutorialStep = NewTutorialStep + 1
			StartNewTutorial(NewTutotialMissionType, NewTutorialStep)
		end
	end	


	
	forbidden = g_up:AddImage(forbidden_pic,1225,50,16,16)
	
	friendInfomationPromot = btn_friend:AddImage(path.."friendMes_hall.BMP",35,-3,19,20)
	friendInfomationPromot:SetTextTip("你有好友申请！")
	friendInfomationPromot:SetVisible(0)
	
	--金币
	show_money = g_up:AddImage(path_lolMain.."money/money.BMP",92,4,26,28)
	show_money:SetTouchEnabled(0)
	--钻石
	show_gold = g_up:AddImage(path_lolMain.."money/gold.BMP",92,36,20,20)
	show_gold:SetTouchEnabled(0)
	
	show_onlinepeople = g_up:AddImage(path_lolMain.."online_hall.BMP",92,64,24,20)
	show_onlinepeople:SetTouchEnabled(0)
	
	--在线人数
	player_level = player_level_bg:AddFontEx("0", 12, 8, 0, 0, 27, 26, 0xffffff)

	
	for i=1,8 do
		posX = (i-1)*9+950
		Money_Img[i] = g_up:AddImage(path_lolMain.."money/0.BMP",posX-840,7,17,19)
		Money_Img[i]:SetTouchEnabled(0)
	
		posX = (i-1)*9+1050
		Gold_Img[i] = g_up:AddImage(path_lolMain.."money/0.BMP",posX-941,36,17,19)
		Gold_Img[i]:SetTouchEnabled(0)
		
		posX = i*9+1145
		online_Img[i] = g_up:AddImage(path_lolMain.."money/0.BMP",posX-1045,65,17,19)
		online_Img[i]:SetTouchEnabled(0)
	end
	
	for index,value in pairs(Money_Img) do
		Money_Img[index]:SetVisible(0)
	end
	for index,value in pairs(Gold_Img) do
		Gold_Img[index]:SetVisible(0)
	end
	for index,value in pairs(online_Img) do
		online_Img[index]:SetVisible(0)
    end
	
	Btn_close = g_up:AddButton(path.."close1_hall1.BMP",path.."close2_hall1.BMP",path.."close3_hall1.BMP",0,93,29,48)
	Btn_close:SetTextTip("关闭")
	Btn_close.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		XGameCloseWindow(1)
	end
	
	Btn_min = g_up:AddButton(path.."min1_hall1.BMP",path.."min2_hall1.BMP",path.."min3_hall1.BMP",29,93,29,48)
	Btn_min:SetTextTip("最小化")
	Btn_min.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		XGameSmallWindow(1)
	end
	
	Btn_setup = g_up:AddButton(path.."setup1_hall1.BMP",path.."setup2_hall1.BMP",path.."setup3_hall1.BMP",59,93,29,48)
	Btn_setup:SetTextTip("设置")
	Btn_setup.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		Set_SetupIsVisible(1)
	end
	
	activity_Effect = g_up:AddEffect("..\\Data\\Magic\\Common\\UI\\changwai\\zaixianjiangli\\tx_UI_CW_zaixianjiangli_02.x",1150,30,1280,800)
	activity_Effect:SetTouchEnabled(0)
	activity_Effect:SetVisible(0)
	
	
	
	-- 时钟塔修行界面
	local close_button = TimeTowerWnd:AddButton(path_shop.."close1_rec.BMP",path_shop.."close2_rec.BMP",path_shop.."close3_rec.BMP",3000,1,35,35)
	close_button.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		TimeTowerWnd:SetVisible(0)
	end
	TimeTowerLogo = TimeTowerWnd:AddButton(path_loltimertower.."base1.BMP",path_loltimertower.."base2.BMP",path_loltimertower.."base3.BMP",-114,-2,35,35)
	TimeTowerLogo.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		SetTimeTowerIsVisible(1)
	end	
	TimeTowerLevel = TimeTowerWnd:AddFont("学阶等级: 10", 15, 0, 220, 7, 200, 20, 0xffffff)
	
	----星星
	for i=1,10 do
		TimeTowerStarBK[i] = TimeTowerWnd:AddImage(path_loltimertower.."StarUn.BMP",3000+(i-1)*26,17,19,18)
		TimeTowerStar[i] = TimeTowerStarBK[i]:AddImage(path_loltimertower.."Star.BMP",3000,0,19,19)
		-- TimeTowerStar[i]:SetVisible(0)
	end
	
	
	TimeTowerWnd:AddFont("本阶已进修", 12, 0, 285, 50, 200, 20, 0xa9afff)
	TimeTowerStarFont = TimeTowerWnd:AddFont("5/10", 12, 0, 300, 70, 200, 20, 0xffffff)
	
	
	TimeTowerTaskWnd = TimeTowerWnd:AddImage(path_loltimertower.."TimeTowerWnd2.BMP",0,90,355,140)
	for i=1,MaxTimeTowerTask do	
		local x = 0
		local y = 51*i-17
		
		Task.Back[i] = CreateWindow(TimeTowerTaskWnd.id,x,y,355,51)--TimeTowerTaskWnd:AddImage(path_Activity.."Backk.BMP",x,y,355,34)
		Task.Title[i] = Task.Back[i]:AddFont("任务内容", 12, 0, 0, 4, 600, 200, 0xa9afff)
		
		Task.MaxValue[i] = Task.Back[i]:AddImage(path_loltimertower.."process.BMP",15,40,262,6)
		Task.Value[i] = Task.MaxValue[i]:AddImage(path_loltimertower.."process2.BMP",1,1,260,4)
		
		Task.Score[i] = Task.Back[i]:AddImage(path_loltimertower.."Star.BMP",300,30,25,22)
		Task.ScoreWord[i] = Task.Score[i]:AddFont("+5", 15, 0, 30, 3, 100, 20, 0xa9afff)		
	end
	Task_toggleBK = TimeTowerTaskWnd:AddImage(path_loltimertower.."toggleBK_main.BMP",350,40,1,100)
	Task_toggleBtn = Task_toggleBK:AddButton(path_loltimertower.."toggleBTN1_main.BMP",path_loltimertower.."toggleBTN2_main.BMP",path_loltimertower.."toggleBTN3_main.BMP",-2,0,5,40)
	
	XSetWindowFlag(Task_toggleBtn.id,1,1,0,60)
	Task_toggleBtn:ToggleBehaviour(XE_ONUPDATE, 1)
	Task_toggleBtn:ToggleEvent(XE_ONUPDATE, 1)
	Task_toggleBtn.script[XE_ONUPDATE] = function()
	    local length = 0
	    if Task_toggleBtn._T == nil then
			Task_toggleBtn._T = 0
		end
		local L,T,R,B = XGetWindowClientPosition(Task_toggleBtn.id)
		local iCount = #TaskInfo.ID
		if Task_toggleBtn._T ~= T then
		    if iCount <=MaxTimeTowerTask then
				length = 60
			else
				length = 60/math.ceil(iCount-MaxTimeTowerTask)
			end
			TaskupdownCount = math.floor(T/length+0.5)
            Hall_TaskDrawBegin()
		    Task_toggleBtn._T = T
		end
	end
		
	-- 设置界面可以滑动
	
	TimeTowerTaskWnd:EnableEvent(XE_MOUSEWHEEL)
	TimeTowerTaskWnd.script[XE_MOUSEWHEEL] = function()
		local updown  = XGetMsgParam0()
		local length = 0
		local iCount = #TaskInfo.ID
		if iCount>MaxTimeTowerTask then
			TaskmaxUpdown = math.ceil(iCount-MaxTimeTowerTask)
			length = 60/TaskmaxUpdown
		else
			TaskmaxUpdown = 0
			length = 60			
		end
		if updown>0 then
			TaskupdownCount = TaskupdownCount-1
			if TaskupdownCount<0 then
				TaskupdownCount=0
			end
		else
			TaskupdownCount = TaskupdownCount+1
			if TaskupdownCount>TaskmaxUpdown then
				TaskupdownCount=TaskmaxUpdown
			end
		end
		
		local btn_pos = length*TaskupdownCount		
		Task_toggleBtn:SetPosition(-2,btn_pos)
		Task_toggleBtn._T = btn_pos
		if TaskupdownCount >= 0 and TaskupdownCount <= TaskmaxUpdown then
			Hall_TaskDrawBegin()
		end	
	end
	
	TimeTowerTaskWnd:SetVisible(0)
	TimeTowerTaskBtn = TimeTowerWnd:AddButton(path_loltimertower .. "TimeTowerTaskBtn1.BMP", path_loltimertower .. "TimeTowerTaskBtn2.BMP", path_loltimertower .. "TimeTowerTaskBtn3.BMP",3000,88,124,21)
	TimeTowerTaskBtn.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		if TimeTowerTaskWnd:IsVisible()==false then
			XReqTimeTowerTaskType(1)
			TimeTowerTaskWnd:SetVisible(1)
			TimeTowerTaskBtn:SetPosition(116,228)
			TimeTowerWnd:SetPosition(11,492)
			
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn4.BMP", Wnd_Button ,0)
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn5.BMP", Wnd_Button ,1)
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn6.BMP", Wnd_Button ,2)
		else
			TimeTowerTaskWnd:SetVisible(0)
			TimeTowerTaskBtn:SetPosition(116,88)
			TimeTowerWnd:SetPosition(11,632)
			
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn1.BMP", Wnd_Button ,0)
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn2.BMP", Wnd_Button ,1)
			XChangeImage(TimeTowerTaskBtn.id, path_loltimertower.."TimeTowerTaskBtn3.BMP", Wnd_Button ,2)
		end
	end
	
	
end


function SetOBBtnIsVisible(flag)--csm无用代码

end
-- 是否需要账号绑定
function SetNeedBindAccount(flag)
	btn_BindAccount:SetVisible(flag)
	
	ResetAllFunctionBtnPosition()	
end
function SetChangeImageBtnVisible(flag)
	btn_ImageChange:SetVisible(flag)
	
	ResetAllFunctionBtnPosition()	
end
function DefaultBK_SetVisible(flag)
	btn_DefaultBK:SetVisible(flag)
	
	ResetAllFunctionBtnPosition()	
end
function HeroDetail_SetVisible(flag)
	btn_HeroDetail:SetVisible(flag)
	
	ResetAllFunctionBtnPosition()
end
function TimeTowerBtn_SetVisible(flag)
	btn_TimeTower:SetVisible(flag)
	
	ResetAllFunctionBtnPosition()
end

function Pos_BindAccount()
	btn_BindAccount:SetPosition(3000,764)
end
function Pos_ChangeHeroBK()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end	
	
	btn_ImageChange:SetPosition(3000+48*count,764)
end
function Pos_DefaultBK()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end
	if btn_ImageChange:IsVisible()==true then
		count = count + 1
	end
	btn_DefaultBK:SetPosition(48*count+3000,764)
end
function Pos_HeroDetail()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end
	if btn_ImageChange:IsVisible()==true then
		count = count + 1
	end
	
	btn_HeroDetail:SetPosition(48*count+3000,764)
end

function Pos_TimeTower()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end
	if btn_ImageChange:IsVisible()==true then
		count = count + 1
	end
	if btn_HeroDetail:IsVisible()==true or btn_DefaultBK:IsVisible()==true then
		count = count + 1
	end
	
	btn_TimeTower:SetPosition(48*count+3000,764)
end

function Pos_CEF()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end
	if btn_ImageChange:IsVisible()==true then
		count = count + 1
	end
	if btn_HeroDetail:IsVisible()==true or btn_DefaultBK:IsVisible()==true then
		count = count + 1
	end
	if btn_TimeTower:IsVisible()==true then
		count = count + 1
	end
	OpenCEF:SetPosition(48*count+3000,764)
end

function Pos_FangChenMi()
	local count=0
	if btn_BindAccount:IsVisible()==true then
		count = count + 1
	end
	if btn_ImageChange:IsVisible()==true then
		count = count + 1
	end
	if btn_HeroDetail:IsVisible()==true or btn_DefaultBK:IsVisible()==true then
		count = count + 1
	end
	if btn_TimeTower:IsVisible()==true then
		count = count + 1
	end
	if OpenCEF:IsVisible() == true then
		count = count + 1
	end
	btn_FangChenMi4399:SetPosition(48*count+3000,764)
end

function ResetAllFunctionBtnPosition()
	Pos_BindAccount()
	Pos_ChangeHeroBK()
	Pos_DefaultBK()
	Pos_HeroDetail()
	Pos_TimeTower()
	Pos_CEF()
	Pos_FangChenMi()
end

function SetOnlineGiftEffectVisible(ibool)
    if ibool == 1 then
		--onlineEffect:ChangeEffect("..\\Data\\Magic\\Common\\UI\\changwai\\zaixianjiangli\\tx_UI_CW_zaixianjiangli_01.x")
	    btn_active_get:SetVisible(1)
	else
	    btn_active_get:SetVisible(0)	
	end
end

function InitCefCloseButton(wnd, bisopen)
	UpdateWnd = g_up:AddImage(path_loltimertower.."BK3.BMP", 205, 131, 870, 539)
	UpdateWnd:AddFont("公告",18,8,0,250,870,539,0xffbcc9ff)
	UpdateWnd:EnableBlackBackgroundTop(1)
	UpdateWnd:SetVisible(0)
	local CloseWndBtn = UpdateWnd:AddButton(path_lolcommon .. "close1.BMP", path_lolcommon .. "close2.BMP", path_lolcommon .. "close3.BMP", 847, -12, 35, 35)
	CloseWndBtn.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		SetUpdateWndIsVisible(0)
	end
	
	UpdateSuprise= UpdateWnd:AddNewCheckButton(path_lolcommon.."tabbar_01.BMP", path_lolcommon.."tabbar_02.BMP", path_lolcommon.."tabbar_03.BMP",18,48,184,44)
	UpdateSuprise:AddFont("精彩内容",18,8,0,0,184,44,0xffffffff)
	UpdateSuprise.script[XE_LBDOWN] = function()
	 
		SetUpdateMenuList(1)
	end
	
	UpdateCEFWeb = UpdateWnd:AddNewCheckButton(path_lolcommon.."tabbar_01.BMP", path_lolcommon.."tabbar_02.BMP", path_lolcommon.."tabbar_03.BMP",208,48,184,44)
	UpdateCEFWeb:AddFont("更新公告",18,8,0,0,184,44,0xffffffff)
	UpdateCEFWeb.script[XE_LBDOWN] = function()
	    
		SetUpdateMenuList(2)
	end
	UpdateShopSkin = UpdateWnd:AddNewCheckButton(path_lolcommon.."tabbar_01.BMP", path_lolcommon.."tabbar_02.BMP", path_lolcommon.."tabbar_03.BMP",398,48,182,44)
	UpdateShopSkin:AddFont("皮肤折扣",18,8,0,0,184,44,0xffffffff)
	UpdateShopSkin.script[XE_LBDOWN] = function()

		SetUpdateMenuList(3)
	end
	XBindNewCheckButton(UpdateSuprise.id, UpdateCEFWeb.id, UpdateShopSkin.id)
	
	
	--精彩活动UI
	UpdateSupriseWnd= CreateWindow(UpdateWnd.id, 0,0,870,539)
	CreateUpdateSupriseWnd(UpdateSupriseWnd)
	--皮肤折扣商店
	UpdateShopSkinWnd = CreateWindow(UpdateWnd.id, 0,0,870,539)
	CreateUpdateShopSkinWnd(UpdateShopSkinWnd)
	
end

function CreateUpdateSupriseWnd(wnd)

	SupriseBG = wnd:AddImage(path_lolcommon.."act1.BMP",18,103,834,404)
	SupriseBG.script[XE_LBUP] = function()
		SupriseEnter(SupriseIndex)
	end
	
	SupriseBG:SetTimer(0,3000).Timer = function(timer,interval)
		SupriseIndex = SupriseIndex + 1
		if SupriseIndex > MAX_SUPRISE then
			SupriseIndex = SupriseIndex % MAX_SUPRISE
		end
		SwitchSuprisePic(SupriseIndex)
	end
	
	for i = 1,MAX_SUPRISE do
		SuprisePoint[i] = SupriseBG:AddImage(path_loltask.."point1.BMP",spx[i],spy[i],22,22)
		SuprisePoint[i].script[XE_LBUP] = function()
			SwitchSuprisePic(i)
		end		
	end
	
	SuprisePointSel = SupriseBG:AddImage(path_loltask.."point2.BMP",spx[1],spy[1],22,22)
	SupriseBG:AddFont("*点击图片前往对应活动界面",15,0,-5,410,300,20,0xff7981a7)
	
	SupriseMaxPage(2)
end

function SwitchSuprisePic(i)
	if i >=1 and i <= MAX_SUPRISE then
		SuprisePointSel:SetPosition(spx[i],spy[i])
		
		SupriseBG.changeimage(strSuprisePath[i])
		
		SupriseIndex = i
	end
end

function SupriseEnter(i)
	if i==1 then	
		XOpenWebByString("http://300.activity.jumpw.com/cases2020/czph/index",1)
	elseif i==2 then
		XClickPlaySound(UI_click_new)
		
		JumpToShopUI(5,3)
		SetUpdateWndIsVisible(0)
	elseif i==3 then
	elseif i==4 then
	elseif i==5 then
	elseif i==6 then	
	end
	-- SetUpdateWndIsVisible(0)
end

function SupriseMaxPage(maxnum)
	for i,v in pairs(spx) do
		spx[i] = spx[i]-12*(maxnum-1)
	end
	for i,v in pairs(SuprisePoint) do		
		SuprisePoint[i]:SetPosition(spx[i],spy[i])
	end
end


function CreateUpdateShopSkinWnd(wnd)	
	ShopSkinWndLeft = CreateWindow(UpdateShopSkinWnd.id, 0,0,130,539)
	ShopSkinWndLeft:AddImage(path_lolactivity.."heroBK.BMP", 1, 99, 122, 439)
	
	ShopSkinWndRight = CreateWindow(UpdateShopSkinWnd.id, 130,0,740,539)
	--左侧英雄名字
	scissorwndHero = CreateWindow(ShopSkinWndLeft.id, 0, 0, 130, 539)
	scissorwndHero:SetTouchEnabled(1)
	scissorwndHero:SetWindowScissorRect(0, 198, 130, 300)
	scissorwndHeroBG = CreateWindow(scissorwndHero.id, 0, 0, 130, 300)
	HeroName_Click = scissorwndHeroBG:AddImage(path_lolactivity.."heroclick.BMP", 1, 98, 122, 100)
	HeroName_Click:SetTouchEnabled(0)
	HeroName_Click:SetVisible(1)
	for i=1, MAXHEROSKIN do
		local x = 1
		local y = 100*i+98
		
		Hero_Back[i] = scissorwndHeroBG:AddImage("", x, y, 122, 100)
		Hero_Head[i] = Hero_Back[i]:AddImage(path_lolequip.."bag_equip.BMP", 28, 7, 66, 66)
		Hero_Head[i]:AddImage(path_lolcard.."FRAME.BMP", 0, 0, 66, 66)
		
		Hero_Name[i] = Hero_Back[i]:AddFont("亚瑟王⊙乔巴特",15,8,0,-40,122,100,0x93aaff)
		
		Hero_Head[i].script[XE_LBUP] = function()
			local L,T = Hero_Back[i]:GetPosition()
			HeroName_Click:SetAbsolutePosition(L,T)
			HeroName_Click:SetVisible(1)
			AllShopSkinData:SetTransparent(0)
			
			XClickShopGoodsTypeButton(1)
			XReqUpdateShopData(HeroNameData.id[i])
		end
	end
	
	AllShopSkinData = ShopSkinWndLeft:AddImage(path_lolactivity.."heroclick.BMP", 1, 98, 122, 100)
	AllShopSkinData:SetTransparent(0)
	AllShopSkinData:AddFont("全部英雄",18,8,0,0,122,100,0x93aaff)
	AllShopSkinData.script[XE_LBUP] = function()		
		HeroName_Click:SetVisible(0)
		AllShopSkinData:SetTransparent(1)
			
		XClickShopGoodsTypeButton(1)
		XReqUpdateShopData(0)
	end
	
	
	-- 显示滚动条
	hero_toggleImg = ShopSkinWndLeft:AddImage(path_lolhero.."toggleBK_main.BMP",140,120,1,392)
	hero_togglebtn = hero_toggleImg:AddButton(path_lolhero.."toggleBTN1_main.BMP",path_lolhero.."toggleBTN2_main.BMP",path_lolhero.."toggleBTN3_main.BMP",-2,0,5,142)
	local ToggleT = hero_toggleImg:AddImage(path_lolhero.."TD1_main.BMP",-3,-9,7,9)
	local ToggleD = hero_toggleImg:AddImage(path_lolhero.."TD2_main.BMP",-3,392,7,9)
	
	XSetWindowFlag(hero_togglebtn.id,1,1,0,250)
	
	hero_togglebtn:ToggleBehaviour(XE_ONUPDATE, 1)
	hero_togglebtn:ToggleEvent(XE_ONUPDATE, 1)
	hero_togglebtn.script[XE_ONUPDATE] = function()
		if hero_togglebtn._T == nil then
			hero_togglebtn._T = 0
		end
		local L,T,R,B = XGetWindowClientPosition(hero_togglebtn.id)
		if hero_togglebtn._T ~= T then
			
			hero_togglebtn._T = T
			hero_togglebtn:SetPosition(-2,T)
			DownManyHero = T
			if DownManyHero<0 then
				DownManyHero  = 0
			end
			local distanc = T/250*(100*(#HeroNameData.id)-200)
			
			local L1,T1,R1,B1 = XGetWindowClientPosition(scissorwndHeroBG.id)
			scissorwndHeroBG._T = T1
			local imgpos = (0 - distanc)
			if imgpos > 0 then
				imgpos = 0
			end
			if imgpos < -50000 then
				imgpos = -50000
			end	
			scissorwndHeroBG:SetPosition(0,imgpos)
		end
	end
		
	-- 设置界面可以滑动
	ShopSkinWndLeft:EnableEvent(XE_MOUSEWHEEL)
	ShopSkinWndLeft.script[XE_MOUSEWHEEL] = function()
		if ShopSkinWndLeft:IsVisible() == false then
		    return
		end
		if #HeroNameData.id<=3 then
			return
		end
		local move = 100*(#HeroNameData.id)-200
		
		local updownMove = 0
		local updown = XGetMsgParam0()
		if updown>0 then
			updownMove = -1*math.ceil(250/100)
		else
			updownMove = math.ceil(250/100)
		end
		
	    local btn_pos = hero_togglebtn._T + updownMove
		if btn_pos < 0 then
		   btn_pos = 0
		end
		if btn_pos >250 then
		   btn_pos = 250
		end		
		DownManyHero = btn_pos
		hero_togglebtn:SetPosition(-2,btn_pos)
		hero_togglebtn._T = btn_pos
		
		local distanc = (btn_pos*move)/250
		
		local BGmove = (0 - distanc)
		if BGmove > 0 then
		    BGmove = 0
		end
		if BGmove < -50000 then
		    BGmove = -50000
		end	
		scissorwndHeroBG:SetPosition(0,BGmove)		
	end
	
	-- 右侧皮肤折扣
	scissorwnd = CreateWindow(ShopSkinWndRight.id, 0, 0, 500, 500)
	scissorwnd:SetTouchEnabled(1)
	scissorwnd:SetWindowScissorRect(20, 100, 710, 420)
	scissorwndBG = CreateWindow(scissorwnd.id, 0, 0, 710, 420)
	for i=1, MAXHEROSKIN do
		local x = 20+118*((i-1)%PERLINEDATA)
		local y = 110+210*(math.ceil(i/PERLINEDATA)-1)
		
		img_GoodsListBackground[i] = scissorwndBG:AddImage("", x, y, 102, 164)
		img_GoodsPic[i] = img_GoodsListBackground[i]:AddImageMultiple(path_equip .. "bag_equip.BMP", "", "", 1, 2, 100, 160)
		-- -- 点击图片
		-- img_GoodsPic[i].script[XE_LBUP] = function()
			-- XClickPlaySound(UI_click_new)
			
			-- XSetShopBuyType(eShopBuy_Normal)
			-- XShopClickBuyItem(GoodsInfo.ItemId[i])
		-- end
		-- 悬浮
		img_GoodsPic[i].script[XE_ONHOVER] = function()
			selec_goods_fight[i]:SetVisible(1)
		end
		-- 离开
		img_GoodsPic[i].script[XE_ONUNHOVER] = function()
			selec_goods_fight[i]:SetVisible(0)
		end
		img_GoodsPic_frame[i] = img_GoodsPic[i]:AddImage(path_lolactivity.."hide.BMP", 0, 0, 102, 164)
		img_GoodsPic_frame[i]:SetTouchEnabled(0)
		selec_goods_fight[i] = img_GoodsPic[i]:AddImage(path_lolshop.."selectfight.BMP", -4, -5, 110, 174)
		selec_goods_fight[i]:SetTouchEnabled(0)
		selec_goods_fight[i]:SetVisible(0)
		img_GoodsMoney[i] = img_GoodsListBackground[i]:AddImage(path_lolactivity.."new.BMP", 2, 124, 98, 19)
		img_GoodsGold[i] = img_GoodsListBackground[i]:AddImage(path_lolactivity.."old.BMP", 2, 143, 98, 19)
		btn_GoodsBuy[i] = img_GoodsListBackground[i]:AddButton(path_lolactivity.."buy1.BMP", path_lolactivity .. "buy2.BMP", path_lolactivity .. "buy3.BMP", 10, 173, 86, 25)
		font_GoodsBuy[i] = btn_GoodsBuy[i]:AddFont("购买", 15, 8, 0, 0, 86, 25, 0xb6ccff)
		btn_GoodsBuy[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			XSetShopBuyType(eShopBuy_Normal)
			XShopClickBuyItem(GoodsInfo.ItemId[i])
		end
		
		-- font_GoodsName[i] = img_GoodsListBackground[i]:AddFontEx("", 12, 8, -5, 10, 115, 55, 0xff83d1e7)
		-- font_GoodsName[i]:SetFontSpace(1, 0)
		-- font_GoodsLastTime[i] = img_GoodsListBackground[i]:AddFont("", 11, 0, 155, 57, 100, 20, 0xffbeb5ee)
		font_GoodsGold[i] = img_GoodsGold[i]:AddFontEx("", 12, 0, 40, 2, 200, 20, 0xff93aaff)
		font_GoodsGold[i]:SetFontSpace(1, 0)
		font_GoodsMoney[i] = img_GoodsMoney[i]:AddFontEx("", 12, 0, 40, 2, 200, 20, 0xfff9c569)
		font_GoodsMoney[i]:SetFontSpace(1, 0)
		-- font_Haved[i] = img_GoodsListBackground[i]:AddFont("已拥有", 12, 8, 0, -165, 125, 20, 0xff73f9ff)
		
		-- 限时标签
		-- img_GoodsFlag[i] = img_GoodsListBackground[i]:AddImage(path_shop .. "flag1_shop.BMP", 62, 35, 51, 51)
		-- img_GoodsFlag[i]:SetTouchEnabled(0)		
		
		
	end
	-- 显示滚动条
	toggleImg = ShopSkinWndRight:AddImage(path_lolhero.."toggleBK_main.BMP",725,112,1,392)
	togglebtn = toggleImg:AddButton(path_lolhero.."toggleBTN1_main.BMP",path_lolhero.."toggleBTN2_main.BMP",path_lolhero.."toggleBTN3_main.BMP",-2,0,5,142)
	local ToggleT = toggleImg:AddImage(path_lolhero.."TD1_main.BMP",-3,-9,7,9)
	local ToggleD = toggleImg:AddImage(path_lolhero.."TD2_main.BMP",-3,392,7,9)
	
	XSetWindowFlag(togglebtn.id,1,1,0,250)
	
	togglebtn:ToggleBehaviour(XE_ONUPDATE, 1)
	togglebtn:ToggleEvent(XE_ONUPDATE, 1)
	togglebtn.script[XE_ONUPDATE] = function()
		if togglebtn._T == nil then
			togglebtn._T = 0
		end
		local L,T,R,B = XGetWindowClientPosition(togglebtn.id)
		if togglebtn._T ~= T then
			
			togglebtn._T = T
			togglebtn:SetPosition(-2,T)
			DownMany = T
			if DownMany<0 then
				DownMany  = 0
			end
			local distanc = T/250*(210*(math.ceil(#GoodsInfo.ItemId/PERLINEDATA)))
			
			local L1,T1,R1,B1 = XGetWindowClientPosition(scissorwndBG.id)
			scissorwndBG._T = T1
			local imgpos = (0 - distanc)
			if imgpos > 0 then
				imgpos = 0
			end
			if imgpos < -50000 then
				imgpos = -50000
			end	
			scissorwndBG:SetPosition(0,imgpos)
		end
	end
		
	-- 设置界面可以滑动
	ShopSkinWndRight:EnableEvent(XE_MOUSEWHEEL)
	ShopSkinWndRight.script[XE_MOUSEWHEEL] = function()
		if ShopSkinWndRight:IsVisible() == false then
		    return
		end
		if #GoodsInfo.ItemId<=12 then
			return
		end
		local move = 210*math.ceil(#GoodsInfo.ItemId/PERLINEDATA)
		
		local updownMove = 0
		local updown = XGetMsgParam0()
		if updown>0 then
			updownMove = -1*math.ceil(250/100)
		else
			updownMove = math.ceil(250/100)
		end
		
		local btn_pos = togglebtn._T + updownMove
		if btn_pos < 0 then
		   btn_pos = 0
		end
		if btn_pos >250 then
		   btn_pos = 250
		end		
		DownMany = btn_pos
		togglebtn:SetPosition(-2,btn_pos)
		togglebtn._T = btn_pos
		
		local distanc = (btn_pos*move)/250
		local BGmove = (0 - distanc)
		if BGmove > 0 then
		    BGmove = 0
		end
		if BGmove < -50000 then
		    BGmove = -50000
		end	
		scissorwndBG:SetPosition(0,BGmove)		
	end
end

function SetUpdateMenuList(i)
	if i==1 then
		XCloseCefButton()
	
		UpdateSupriseWnd:SetVisible(1)
		UpdateShopSkinWnd:SetVisible(0)
		UpdateSuprise:SetCheckButtonClicked(1)
	elseif i==2 then
		XOpenCefButton(505,215,235,860,419)
		
		UpdateSupriseWnd:SetVisible(0)
		UpdateShopSkinWnd:SetVisible(0)
		UpdateCEFWeb:SetCheckButtonClicked(1)
	elseif i==3 then		
		XCloseCefButton()
		
		XClickShopGoodsTypeButton(1,1)
		XReqUpdateShopData(0)
		AllShopSkinData:SetTransparent(1)
		
		UpdateSupriseWnd:SetVisible(0)
		UpdateShopSkinWnd:SetVisible(1)
		UpdateShopSkin:SetCheckButtonClicked(1)
	end
end



function closeAllCef()
    XCloseCefButton()
end

function ReturnToMenuList(index)
	if index ~= 8 then
		btn_AddMoney:SetVisible(0)
	end
	if index==0 then
		-- btn_BK:SetVisible(0)
		
		--SetGameHallIsVisible(1)
		ReturnToGameHall(1)
		SetGameFightIsVisible(0)
		SetGameEquipIsVisible(0)
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)
		SetShopObjectVisible(0)
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)	
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.Return,"")
		wnd_chat.ShowAdv(1, bIs4399)
		SetUI_AllActivityVisible(1)
	elseif index==1 then
		-- btn_BK:SetVisible(1)
		-- btn_BK:SetPosition(20,0)
		
		--SetGameHallIsVisible(0)
		SetGameFightIsVisible(1)
		SetGameEquipIsVisible(0)
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)	
		SetShopObjectVisible(0)
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)	
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.Return,"")
		wnd_chat.ShowAdv(0, bIs4399)
        SetUI_AllActivityVisible(0)
	elseif index==2 then
		-- btn_BK:SetVisible(1)
		-- btn_BK:SetPosition(110,0)
		
		--SetGameHallIsVisible(0)
		SetGameFightIsVisible(0)
		SetGameEquipIsVisible(1)
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)	
		SetShopObjectVisible(0)
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.ZhuangBei,path_lolequip.."BK.BMP",g_game_equip_ui)
		wnd_chat.ShowAdv(0, bIs4399)
		SetUI_AllActivityVisible(0)
	elseif index==3 then
		-- btn_BK:SetVisible(1)									
		-- btn_BK:SetPosition(200,0)								
		
		--SetGameHallIsVisible(0)											
		SetGameFightIsVisible(0)									
		SetGameEquipIsVisible(0)											
		SetGameHeroIsVisible(1)
		SetGameOBIsVisible(0)											
		SetShopObjectVisible(0)		
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)				
		SetPlayerInfoIsVisible(0)	
		PlayGameHallBKAnim(AllWindowIdx.Yingxiong,path_lolcard.."BK.BMP",g_game_hero_ui)
		wnd_chat.ShowAdv(0, bIs4399)
		SetUI_AllActivityVisible(0)
	elseif index==4 then
		-- btn_BK:SetVisible(1)
		-- btn_BK:SetPosition(290,0)
		
		--SetGameHallIsVisible(0)
		SetGameFightIsVisible(0)
		SetGameEquipIsVisible(0)
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)	
		SetShopObjectVisible(1)
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.ShangCheng,path_lolshop.."BK.BMP",g_ShopObject_ui)
		wnd_chat.ShowAdv(0, bIs4399)
		SetUI_AllActivityVisible(0)
	elseif index==5 then
		SetBindAccountIsVisible(1)		
	elseif index==6 then
		-- btn_BK:SetVisible(0)
		
		--SetGameHallIsVisible(0)			
		SetGameFightIsVisible(0)		
		SetGameEquipIsVisible(0)		
		SetGameHeroIsVisible(0)	
		SetGameOBIsVisible(0)			
		SetShopObjectVisible(0)			
		SetTaskIsVisible(1,1)
		SetActivityIsVisible(0)			
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.RenWu,path_loltask.."BK.BMP",g_task_ui)
		wnd_chat.ShowAdv(0, bIs4399)
		SetUI_AllActivityVisible(0)
	elseif index==7 then
		XSetTalkIsVisible()
	elseif index==8 then
		XSetMailIsVisible()
	elseif index==9 then
		-- btn_BK:SetVisible(0)
		btn_game:SetCheckButtonClicked(0)
		btn_equip:SetCheckButtonClicked(0)
		btn_hero:SetCheckButtonClicked(0)
		btn_shop:SetCheckButtonClicked(0)
		btn_signtask:SetCheckButtonClicked(0)
		btn_active:SetCheckButtonClicked(0)	
		SetWatchPlayerInfoVisible(0)
		--SetGameHallIsVisible(0)
		SetGameFightIsVisible(0)
		SetGameEquipIsVisible(0)
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)	
		SetShopObjectVisible(0)
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)
		SetPlayerInfoIsVisible(1)
		PlayGameHallBKAnim(AllWindowIdx.GeRen, path_lolplayerinfo.."BK.BMP",g_PlayerInfo_ui)
		wnd_chat.ShowAdv(0, bIs4399)
		SetUI_AllActivityVisible(0)
	-- elseif index==10 then
		-- -- btn_BK:SetVisible(0)
		
		-- --SetGameHallIsVisible(0)			
		-- SetGameFightIsVisible(0)		
		-- SetGameEquipIsVisible(0)		
		-- SetGameHeroIsVisible(0)
		-- SetGameOBIsVisible(0)		
		-- SetShopObjectVisible(0)			
		-- SetTaskIsVisible(1,2)
		-- SetActivityIsVisible(0)
		-- SetPlayerInfoIsVisible(0)
		-- PlayGameHallBKAnim(AllWindowIdx.RenWu,path_loltask.."BK.BMP",g_task_ui)
		-- wnd_chat.ShowAdv(0)
		-- SetUI_AllActivityVisible(0)
	elseif index==11 then
		-- btn_BK:SetVisible(1)									
		-- btn_BK:SetPosition(380,0)								
		
		--SetGameHallIsVisible(0)											
		SetGameFightIsVisible(0)									
		SetGameEquipIsVisible(0)											
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(1)
		SetShopObjectVisible(0)		
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(0)				
		SetPlayerInfoIsVisible(0)	
		SetUI_AllActivityVisible(0)
	elseif index==12 then
        -- btn_BK:SetVisible(0)
		
		--SetGameHallIsVisible(0)			
		SetGameFightIsVisible(0)		
		SetGameEquipIsVisible(0)		
		SetGameHeroIsVisible(0)
		SetGameOBIsVisible(0)		
		SetShopObjectVisible(0)			
		SetTaskIsVisible(0,0)
		SetActivityIsVisible(1)
		SetPlayerInfoIsVisible(0)
		PlayGameHallBKAnim(AllWindowIdx.HuoDong,path_lolactivity.."BK.BMP",g_activity_ui)
		wnd_chat.ShowAdv(0, bIs4399)	
		SetUI_AllActivityVisible(0)
	end
end
----------设置跳到快速匹配界面
function Set_JumpToGameMode()
		if XGetMapId()==1 then	--先解决场内跳出来领取新手礼包的提示
			-- btn_game:TriggerBehaviour(XE_LBDOWN)
			-- btn_game:CancelCapture()
			XNeedNeophyteTutorialTaskInfo(1)
			CheckTaskButtonState(1)
		end
end
---------设置跳转到装备界面
function Set_JumpToEquip()
		btn_equip:TriggerBehaviour(XE_LBUP)
		btn_equip:CancelCapture()
		JumpToEquip = 0		
end
---------设置跳转到英雄集卡书界面
function Set_JumpToHeroAll()
		btn_hero:TriggerBehaviour(XE_LBUP)
		btn_hero:CancelCapture()
		JumpToEquip = 1		
end
----------设置跳到商城英雄界面
function Set_JumpToShopHero()
		btn_shop:TriggerBehaviour(XE_LBUP)
		btn_shop:CancelCapture()
		JumpToHero()
end
----------设置跳到商城英雄皮肤界面
function Set_JumpToShopHeroSkin()
		btn_shop:TriggerBehaviour(XE_LBUP)
		btn_shop:CancelCapture()
		JumpToHeroSkin()
end
----------设置跳到集卡书二级页面
function Set_JumpToHeroDetail()
		btn_hero:TriggerBehaviour(XE_LBUP)
		btn_hero:CancelCapture()
		OpenSomeoneHeroInfo(MainHall_BKHeroId)		-- 跳到金刚的集卡书二级页
		IsReturnToShop = false		
end
----------设置跳到物品合成
function Set_JumpToEquipSynthesize()
		btn_equip:TriggerBehaviour(XE_LBUP)
		btn_equip:CancelCapture()
		Set_JumpToEquipSynthesizeSec()	
end
----------设置跳转到个人信息
function Set_JumpToPlayerInfo()
		btn_headPicImg:TriggerBehaviour(XE_LBUP)
end

function Set_JumpToActivity()
	-- btn_active:TriggerBehaviour(XE_LBUP)
end

function Set_JumpToHall()
	btn_webSite:TriggerBehaviour(XE_LBUP)
end
function SetChatAdvWndHide()
	wnd_chat.ShowAdv(0)	
end

function PiPeiZhiZhenPlayFinish()
	local posx,posy = pipei_zhizhen:GetPosition()
	MovePointer(pipei_zhizhen, posx+16, posy, -90, 29, 0, PiPeiZhiZhenPlayFinish)
	XClickPlaySound(UI_clock_new)
end

-- 设置等待排队界面是否显示
function SetWaitTimeUiIsVisible(bVisible)
	isMathing = bVisible
	if bVisible == 1 then
		if math_type == 0 then
			XPlayEffectByName(pipei_1.id, "idle_3", 0)
		elseif math_type == 1 then
			XPlayEffectByName(pipei_1.id, "idle_2", 0)
		else
			XPlayEffectByName(pipei_1.id, "idle_4", 0)
		end
		XPlayEffectByName(pipei_2.id, "idle", 1)
		Play_Enabled_Image:SetVisible(1)
		local posx,posy = pipei_zhizhen:GetPosition()
		MovePointer(pipei_zhizhen, posx+16, posy, -90, 29, 0, PiPeiZhiZhenPlayFinish)
		pipei_zhizhen:SetVisible(1)
	else
		pipeiL_bg:SetTouchEnabled(1)
		pipeiR_bg:SetTouchEnabled(1)
		pipeiL_bg:SetVisible(0)
		pipeiR_bg:SetVisible(0)
		Play_Enabled_Image:SetVisible(0)
		pipei_zhizhen:SetVisible(0)
		pipei_zhizhen:KillTimer(0)
		XPlayEffectByName(pipei_2.id, "dead", 0)
		if math_type == 0 then
			XPlayEffectByName(pipei_1.id, "dead_3", 0)
			XClickStopSound(UI_select_play_loop_new)
		elseif math_type == 1 then
			XPlayEffectByName(pipei_1.id, "dead_2", 0)
			XClickStopSound(UI_select_play_loop_new)
		else
			XPlayEffectByName(pipei_1.id, "dead_4", 0)
			XClickStopSound(UI_select_play_loop_new)
		end
		math_type = -1
		isPlay = 0
	end
	img_WaitTimeBg:SetVisible(bVisible)
	if bVisible == true then
	    SetPlayerImagVisible(false)
	else
	    SetPlayerImagVisible(true)	
	end
end

function SetMatingType(iType)
	math_type = iType
end

function GetMatchingType()
	return math_type
end

-- 得到时间并显示
function GetWaitTime(index)
	local minutes = tonumber(string.format("%d",index/60))	--log("\nminutes = "..minutes)
	local seconds = tonumber(string.format("%d",index%60))  --log("\nseconds = "..seconds)
	
	secondL = tonumber(string.format("%d",seconds/10))
	second  = tonumber(string.format("%d",seconds%10))
	
	minuteL = tonumber(string.format("%d",minutes/10))
	minute  = tonumber(string.format("%d",minutes%10))
	
	img_TimerRRight.changeimage(path_lolcommon .. second .. ".BMP")
	img_TimerRLeft.changeimage(path_lolcommon .. secondL .. ".BMP")
	img_TimerLRight.changeimage(path_lolcommon .. minute .. ".BMP")
	img_TimerLLeft.changeimage(path_lolcommon .. minuteL .. ".BMP")
	count = index
end

-- 清空上次的时间
function ClearTime()
	count = 0
	second = 0
	secondL = 0
	minute = 0
	minuteL = 0

	img_TimerRRight.changeimage(path .. "queuenum/0.BMP")
	img_TimerRLeft.changeimage(path .. "queuenum/0.BMP")
	img_TimerLRight.changeimage(path .. "queuenum/0.BMP")
	img_TimerLLeft.changeimage(path .. "queuenum/0.BMP")
end


function Click_M_OpenShop()
	ReturnToMenuList(4)
end

function Click_O_OpenEquip()
	ReturnToMenuList(2)
end

-- 签到、个人信息部分
function ChangeSummoner_head(pictureName)
	btn_headPicImg.changeimage(pictureName)
end
function FirstChangeSummoner_headXYWH(pictureName)
	btn_headPicImg.changeimage(pictureName)
	FirstCurrent_SummonerHead(pictureName)
end
function ChangeSummoner_headXYWH(pictureName)
	btn_headPicImg.changeimage(pictureName)
	Current_SummonerHead(pictureName)
end

--清除金币
function ClearMoneyNum(sz)
	max_money = sz
	local flag = 0
	if g_shop_hero_equip_ui:IsVisible()==true then
		flag = 1
	end
	for index,value in pairs(Money_Img) do
		if index <=sz then
			Money_Img[index]:SetVisible(flag)
		else
			Money_Img[index]:SetVisible(0)
		end
	end
end
--清除钻石
function ClearGoldNum(sz)
	max_gold = sz
	local flag = 0
	if g_shop_hero_equip_ui:IsVisible()==true then
		flag = 1
	end
	for index,value in pairs(Gold_Img) do
		if index <=sz then
			Gold_Img[index]:SetVisible(flag)
		else
			Gold_Img[index]:SetVisible(0)
		end
	end
end
--清除在线人数
function ClearOnlineNum(sz)
	max_online = sz
	local flag = 0
	if g_shop_hero_equip_ui:IsVisible()==true then
		flag = 1
	end
    for index,value in pairs(online_Img) do
	    if index <=sz then
	    	online_Img[index]:SetVisible(flag)
    	else
		   online_Img[index]:SetVisible(0)
	    end
    end
end

--设置等级数字
function SendLvNumToLua(Lv)
	player_level:SetFontText(Lv,0x593e2d)
end
function SendVipLvNumToLua(level,uExtLevel)

end


--设置未读邮件数字
function SendMailNumToLua(mail)
	player_mail:SetFontText(mail,0xfff4f4c1)
	if 0 == mail then
		btn_mailNum:SetVisible(0)
	else
		btn_mailNum:SetVisible(1)
	end
end
--设置在线好友数量
function SendOnlineFriendNumToLua(friend)
	player_friend:SetFontText(friend,0xf4f4c1)
end
--设置金币数量
function SendMoneyNumToLua(money,Fth)
	local money_lua = path_lolMain.."money/"..money..".BMP"
	Money_Img[Fth].changeimage(money_lua)	
end
--设置钻石数量
function SendGoldNumToLua(gold,Fth)
	local gold_lua = path_lolMain.."money/"..gold..".BMP"
	Gold_Img[Fth].changeimage(gold_lua)
end
--设置在线人数
function SendonlineNumToLua(people,Fth)
	local online_lua = path_lolMain.."money/"..people..".BMP"
	online_Img[Fth].changeimage(online_lua)
end

--设置玩家游戏惩罚
function SetPunish(IsPunish,tip)
	
	forbidden:SetVisible(IsPunish)
	forbidden:SetImageTip(tip)
		
end
-- 有好友申请
function SetAddFriendPromotVisible(flag)
	if flag == 1 and friendInfomationPromot:IsVisible()==false then
		friendInfomationPromot:SetVisible(1)
	elseif flag == 0 and friendInfomationPromot:IsVisible()==true then
		friendInfomationPromot:SetVisible(0)
	end
end	
function UpdateOnlineInfoImgVisible()
	for index,value in pairs(Money_Img) do
		if index <=max_money then
			Money_Img[index]:SetVisible(1)
		else
			Money_Img[index]:SetVisible(0)
		end
	end
	for index,value in pairs(Gold_Img) do
		if index <=max_gold then
			Gold_Img[index]:SetVisible(1)
		else
			Gold_Img[index]:SetVisible(0)
		end
	end
	 for index,value in pairs(online_Img) do
		 if index <=max_online then
			 online_Img[index]:SetVisible(1)
		 else
			 online_Img[index]:SetVisible(0)
		 end
	end
end

function SetReturnVisible(flag)
	BTN_RETURN:SetVisible(flag)
end

function GetFirstCheckButtonVisible()
	if btn_firstcharge ~= nil and btn_firstcharge:IsVisible()==true then
		return 1
	else
		return 0
	end
end


function GetWndTobtn_hero()
	return btn_hero
end

function GetWndTobtn_headPicImg()
	return btn_headPicImg
end

function GetWndTobtn_shop()
	return btn_shop
end

function GetWndTobtn_equip()
	return btn_equip
end

function GetWndTobtn_game()
	return btn_game
end

-- 设置是否显示
function SetFourpartUIVisiable(flag)
log("\nSetFourpartUIVisiable(flag) = "..flag)
	if g_shop_hero_equip_ui ~= nil then
		if flag==1 then
			-- btn_BK:SetVisible(0)
			btn_game:SetCheckButtonClicked(0)
			btn_equip:SetCheckButtonClicked(0)
			btn_hero:SetCheckButtonClicked(0)
			btn_shop:SetCheckButtonClicked(0)
			btn_signtask:SetCheckButtonClicked(0)
			btn_active:SetCheckButtonClicked(0)
			btn_OB:SetCheckButtonClicked(0)
			SetFourpartUI_PlayIMG(1)
		elseif flag>=1 then			
			SetFourpartUI_PlayIMG(2)		
		end
		if flag==10 then
			SetFourpartUI_UP(0)
		else
			SetFourpartUI_UP(1)
		end
		SetFourpartUI_Hide(0)
		if flag > 0 and g_shop_hero_equip_ui:IsVisible()==false then
			g_shop_hero_equip_ui:SetVisible(1)
			UpdateOnlineInfoImgVisible()		
	
		elseif flag == 0 and g_shop_hero_equip_ui:IsVisible()==true then
			g_shop_hero_equip_ui:SetVisible(0)
		end
	end
end

-- 1代表大厅；否则代表其他
local Last_UI_Flag = 0
function SetFourpartUI_PlayIMG(flag)
	local is_play = 0
	if Last_UI_Flag ~= flag then
		Last_UI_Flag = flag
		is_play = 1
	end
	
	pipeiL_bg:SetTouchEnabled(1)
	pipeiR_bg:SetTouchEnabled(1)

	if flag==1 then		
		if isMathing == 1 and is_play == 1 then
			if math_type == 0 then
				XPlayEffectByName(pipei_1.id, "idle_3", 0)
			elseif math_type == 1 then
				XPlayEffectByName(pipei_1.id, "idle_2", 0)
			else
				XPlayEffectByName(pipei_1.id, "idle_4", 0)
			end
			--XPlayEffectByName(pipei_2.id, "idle", 0)
			-- Play_Enabled_Image.changeimage(path_lolhero.."play.BMP")
			local posx,posy = pipei_zhizhen:GetPosition()
			MovePointer(pipei_zhizhen, posx+16, posy, -90, 29, 0, PiPeiZhiZhenPlayFinish)
			pipei_zhizhen:SetVisible(1)
		end
		
		XChangeImage(btn_game.id, path_lolMain.."game1_hall.BMP", Wnd_Button ,0)
		XChangeImage(btn_game.id, path_lolMain.."game2_hall.BMP", Wnd_Button ,1)
		XChangeImage(btn_game.id, path_lolMain.."game3_hall.BMP", Wnd_Button ,2)
		SUMMONERBK:SetVisible(0)
	else		
		if isMathing == 1 and is_play == 1 then
			pipei_zhizhen:SetVisible(0)
			pipei_zhizhen:KillTimer(0)
			pipeiL_bg:SetTouchEnabled(0)
			pipeiR_bg:SetTouchEnabled(0)
			--XPlayEffectByName(pipei_2.id, "dead", 0)
			if math_type == 0 then
				XPlayEffectByName(pipei_1.id, "dead_3", 0)
				XClickStopSound(UI_select_play_loop_new)
			elseif math_type == 1 then
				XPlayEffectByName(pipei_1.id, "dead_2", 0)
				XClickStopSound(UI_select_play_loop_new)
			else
				XPlayEffectByName(pipei_1.id, "dead_4", 0)
				XClickStopSound(UI_select_play_loop_new)
			end
		end
		
		XChangeImage(btn_game.id, path_lolMain.."game1_hall.BMP", Wnd_Button ,0)
		XChangeImage(btn_game.id, path_lolMain.."game2_hall.BMP", Wnd_Button ,1)
		XChangeImage(btn_game.id, path_lolMain.."game3_hall.BMP", Wnd_Button ,2)
		SUMMONERBK:SetVisible(1)
	end
end

function PlayMatchEffect(name)
	if isMathing == 0 then
		XPlayEffectByName(pipei_1.id, name, 0)
	end
end

function IsCanPlaySelectEffect(isCan)
	isPlay = isCan
	if isCan == 1 then
		pipeiL_bg:SetVisible(1)
		pipeiR_bg:SetVisible(1)
	else
		pipeiL_bg:SetVisible(0)
		pipeiR_bg:SetVisible(0)
	end
end

function GetIsCanPlaySelectEffect()
	if isPlay == 0 then
		return 1
	else
		return 0
	end
end



function SetFourpartUI_UP(flag)
	if flag==1 then
		g_up:SetVisible(1)
		g_down:SetVisible(1)
	else
		g_up:SetVisible(0)
		g_down:SetVisible(1)
	end
end

function SetFourpartUI_Hide(flag)
	BTN_RETURNHIDE:SetVisible(flag)
end







-- 设置新手教学入口是否显示
function SetNeophyteTutorialBtnVisible(ibool)
    NeophyteTutorialBtn:SetVisible(ibool)
	
	ResetPosition_ActivityBtn()
end
function SetFirstCheckButtonVisible( bVisible )
	btn_firstcharge:SetVisible( bVisible )
	SetPlayerVIP_FirstCharge( bVisible )
	ResetPosition_ActivityBtn()
end


-- 设置玩家回归入口是否显示
function SetOldPlayerRegressionVisible(ibool)
    OldPlayerRegression:SetVisible(ibool)
	
	ResetPosition_ActivityBtn()
end

function Setbtn_SevenOnlineGiftVisible(ibool)
    btn_SevenOnlineGift:SetVisible(ibool)
	
	ResetPosition_ActivityBtn()
end

function Setbtn_FangChenMi4399Visible(b)
	if btn_FangChenMi4399 ~= nil then
		btn_FangChenMi4399:SetVisible(b)
		ResetAllFunctionBtnPosition()
	end
end

--7、4399活动1
function SetVisible_FirstMailBtn(flag)
	if Get4399Mail ~= nil then
		Get4399Mail:SetVisible(flag)
		Get4399Mail:SetPosition(49,444)
	end
end
--18、4399活动2
function SetVisible_4399MailBtn(flag)
	if Get4399Mail2 ~= nil and Get4399Mail ~= nil then
		Get4399Mail2:SetVisible(flag)
		Get4399Mail2:SetPosition(49,540)
		
		if Get4399Mail:IsVisible() == false then
			Get4399Mail2:SetPosition(49,444)
		end
	end
end
-- 排序右侧活动
function Pos_firstcharge()
	local count = 0
		
	btn_firstcharge:SetPosition(1238,145+49*count)
end
function Pos_NeophyteTutorialBtn()
	local count = 0	
	if(btn_firstcharge:IsVisible()==true)then		
		count = count + 1
	end
		
	NeophyteTutorialBtn:SetPosition(1238,145+49*count)
end

function Pos_OldPlayerRegression()
	local count = 0
	if(btn_firstcharge:IsVisible()==true)then		
		count = count + 1
	end
	if(NeophyteTutorialBtn:IsVisible()==true)then		
		count = count + 1
	end
		
	OldPlayerRegression:SetPosition(1238,145+49*count)
end

function Pos_SevenOnlineGift()
	local count = 0
	if(btn_firstcharge:IsVisible()==true)then		
		count = count + 1
	end
	if(NeophyteTutorialBtn:IsVisible()==true)then		
		count = count + 1
	end
	if(OldPlayerRegression:IsVisible()==true)then		
		count = count + 1
	end
		
	btn_SevenOnlineGift:SetPosition(1238,145+49*count)
end

function ResetPosition_ActivityBtn()
	Pos_firstcharge()
	Pos_NeophyteTutorialBtn()
	-- Pos_CEF()
	Pos_OldPlayerRegression()
	Pos_SevenOnlineGift()
	
	local count = 1
	if(btn_firstcharge:IsVisible()==true)then		
		count = count + 1
	end
	if(NeophyteTutorialBtn:IsVisible()==true)then		
		count = count + 1
	end
	if(OldPlayerRegression:IsVisible()==true)then		
		count = count + 1
	end
	if(btn_SevenOnlineGift:IsVisible()==true)then		
		count = count + 1
	end
	
	RightActivity:SetWH(48,51*count+64)
end

-- 设置匹配特效开始播放范围
function GetMatchingEffectMinVaule()
	return 45
end

-- 设置匹配特效结束播放范围
function GetMatchingEffectMaxVaule()
	return 135
end

-- 设置匹配特效延时多少秒开始播放
function GetMatchingEffectTimeVaule()
	return 500
end






--时钟塔
function Hall_ClearTaskInfo()
	TaskInfo = {}
	TaskInfo.ID = {}
	TaskInfo.Title = {}
	TaskInfo.Value = {}
	TaskInfo.MaxValue = {}
	TaskInfo.Score = {}
	
	TaskupdownCount = 0
	TaskmaxUpdown = 0		
	Task_toggleBtn:SetPosition(-2,0)
	Task_toggleBtn._T = 0
	
end
function Hall_SetTaskDetail(i,detail,ID,score,value,maxvalue)
	TaskInfo.ID[i] = ID
	TaskInfo.Title[i] = detail
	TaskInfo.Value[i] = value
	TaskInfo.MaxValue[i] = maxvalue
	TaskInfo.Score[i] = score
end

function Hall_TaskDrawBegin()
	local iCount = #TaskInfo.ID
	
	for i = 1,MaxTimeTowerTask do
	    Task.Back[i]:SetVisible(0)
	end

	for i=1,iCount do
		if i > TaskupdownCount and i <= TaskupdownCount+MaxTimeTowerTask then
			Task.Title[i-TaskupdownCount]:SetFontText(TaskInfo.Title[i],0xa9afff)
			Task.ScoreWord[i-TaskupdownCount]:SetFontText(TaskInfo.Score[i],0xa9afff)
		
			if TaskInfo.MaxValue[i]>0 then
				Task.MaxValue[i-TaskupdownCount]:SetVisible(1)
				XSetAddImageRect(Task.Value[i-TaskupdownCount].id, 0, 0, (TaskInfo.Value[i]/TaskInfo.MaxValue[i])*260, 4, 1, 1, (TaskInfo.Value[i]/TaskInfo.MaxValue[i])*260, 4)
			else
				Task.MaxValue[i-TaskupdownCount]:SetVisible(0)
			end
			Task.Back[i-TaskupdownCount]:SetVisible(1)			
		end
	end	

	if iCount<=MaxTimeTowerTask then
	    Task_toggleBK:SetVisible(0)
	else
	    Task_toggleBK:SetVisible(1)	
	end
end


function Hall_TimeTowerLevelInfo(singleLvMax)
	TimeTowerSingleLvMax = singleLvMax
end

function Hall_TimeTowerBaseInfo(lv,experience,ishigh)
	TimeTowerLevel:SetFontText("学阶等级 : "..lv,0xffffff)
	TimeTowerStarFont:SetFontText(experience.."/"..TimeTowerSingleLvMax,0xFFFFFF)
	
	for i,v in pairs(TimeTowerStar) do
		if i<=TimeTowerSingleLvMax then
			TimeTowerStarBK[i]:SetVisible(1)
		else
			TimeTowerStarBK[i]:SetVisible(0)
		end
		if experience>=i then
			TimeTowerStar[i]:SetVisible(1)
		else
			TimeTowerStar[i]:SetVisible(0)
		end
	end
	
	if ishigh==1 then
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."high1.BMP", Wnd_Button,0)
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."high2.BMP", Wnd_Button,1)
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."high3.BMP", Wnd_Button,2)
		
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower4.BMP", Wnd_Button,0)
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower5.BMP", Wnd_Button,1)
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower6.BMP", Wnd_Button,2)
		
		TimeTowerLogoFont:SetVisible(0)
	else
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."base1.BMP", Wnd_Button,0)
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."base2.BMP", Wnd_Button,1)
		XChangeImage(TimeTowerLogo.id, path_loltimertower.."base3.BMP", Wnd_Button,2)
		
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower1.BMP", Wnd_Button,0)
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower2.BMP", Wnd_Button,1)
		XChangeImage(TimeTower.id, path_lolMain.."TimeTower3.BMP", Wnd_Button,2)		
	end
end


function TimeTower_SetVisible(flag)
	bForbidTimeTower = flag
	if flag == 0 then
		TimeTowerWnd:SetVisible(0)
		TimeTowerBtn_SetVisible(0)
	else
		TimeTowerWnd:SetVisible(1)
		TimeTowerBtn_SetVisible(1)
	end
end

function SetIs4399(is4399)
	bIs4399 = is4399
end










-- 清除具体信息
function Clear_UpdateHeroData()
	HeroNameData = {}
	HeroNameData.head = {}
	HeroNameData.name = {}
	HeroNameData.id = {}
	
	for i,v in pairs(Hero_Back) do
		Hero_Back[i]:SetVisible(0)
	end

	DownManyHero = 0
	hero_togglebtn:SetPosition(-2,0)
	hero_togglebtn._T = 0
	hero_toggleImg:SetVisible(0)
	scissorwndHeroBG:SetPosition(0,0)
end

function Set_UpdateHeroData(i, head, name, id)
	HeroNameData.head[i] = head
	HeroNameData.name[i] = name
	HeroNameData.id[i] = id
	
	if i>3 then
		hero_toggleImg:SetVisible(1)
	else
		hero_toggleImg:SetVisible(0)
	end
	Hero_Head[i].changeimage(head)
	Hero_Name[i]:SetFontText(name,0x93aaff)
	Hero_Back[i]:SetVisible(1)
end

function Clear_UpdateShopGoodsData()
	GoodsInfo = {}
	GoodsInfo.ItemId = {}
	GoodsInfo.Name = {}
	GoodsInfo.Describe = {}
	GoodsInfo.Path_1 = {}
	GoodsInfo.Path_2 = {}
	GoodsInfo.Path_3 = {}
	GoodsInfo.IsCanBuy = {}
	GoodsInfo.IsCanFree = {}
	GoodsInfo.Tip = {}
	GoodsInfo.Gold = {}
	GoodsInfo.Money = {}
	GoodsInfo.Honour = {}
	GoodsInfo.Contri = {}
	GoodsInfo.Vip = {}
	GoodsInfo.LastTime = {}
	GoodsInfo.Flag = {}
	GoodsInfo.BuyText = {}
	GoodsInfo.IsSuperSkin = {}
	
	for i,v in pairs(img_GoodsListBackground) do
		img_GoodsListBackground[i]:SetVisible(0)
	end
	
	DownMany = 0
	togglebtn:SetPosition(-2,0)
	toggleImg:SetVisible(0)
	togglebtn._T = 0
	scissorwndBG:SetPosition(0,0)	
end
-- 设置具体信息
function Set_UpdateShopGoodsData(i, itemid, name, path_1, path_2, path_3, iscanbuy, iscanfree, tip, gold, money, honour, contri, vip, lasttime, flag, buytext, issuperskin)
	GoodsInfo[i] = i
	GoodsInfo.ItemId[i] = itemid
	GoodsInfo.Name[i] = name
	GoodsInfo.Path_1[i] = path_1
	GoodsInfo.Path_2[i] = path_2
	GoodsInfo.Path_3[i] = path_3
	GoodsInfo.IsCanBuy[i] = iscanbuy
	GoodsInfo.IsCanFree[i] = iscanfree
	
	GoodsInfo.Tip[i] = tip
	GoodsInfo.Gold[i] = gold	
	GoodsInfo.Money[i] = money
	
	GoodsInfo.Honour[i] = honour
	GoodsInfo.Contri[i] = contri
	GoodsInfo.Vip[i] = vip
	GoodsInfo.LastTime[i] = lasttime
	GoodsInfo.Flag[i] = flag
	
	GoodsInfo.BuyText[i] = buytext	
	GoodsInfo.IsSuperSkin[i] = issuperskin
	
	if i>12 then
		toggleImg:SetVisible(1)
	else
		toggleImg:SetVisible(0)
	end
	-- 商品图片
	img_GoodsPic[i].changeimageMultiple("..\\" .. GoodsInfo.Path_1[i], "..\\" .. GoodsInfo.Path_2[i], "..\\" .. GoodsInfo.Path_3[i])
	XSetImageTip(img_GoodsPic[i].id, GoodsInfo.Tip[i])
	
	-- 限定道具不显示购买
	local UnShowItemId = {224, 225}
	local is_show_buy_ui = 1
	for index = 1, #UnShowItemId do
		if UnShowItemId[index] == GoodsInfo.ItemId[i] then
			is_show_buy_ui = 0
			break
		end
	end
	
	local offX = 10
	local offY = 7
	--
	if is_show_buy_ui == 1 then
		-- 金币
		font_GoodsMoney[i]:SetFontText(GoodsInfo.Money[i], 0xfff9c569)
		font_GoodsGold[i]:SetFontText(GoodsInfo.Gold[i], 0xff93aaff)
		
		btn_GoodsBuy[i]:SetEnabled(GoodsInfo.IsCanBuy[i])
		font_GoodsBuy[i]:SetFontText(GoodsInfo.BuyText[i], 0xffb6ccff)
	end
	
	img_GoodsListBackground[i]:SetVisible(1)
end

-- 默认关闭更新公告功能
function SetOpenUpdateBtn(flag)
	Updatebk:SetEnabled(flag)
end



function SetMain_Credit(num,decrease,limit)
	if( num<limit )then	-- 进小黑了
		BlackHouseIn = 1
	else
		BlackHouseIn = 0
	end
		
	if( decrease>0 and decrease<=100 ) then
		img_Credit:SetTextTip("收益减少"..decrease.."%")
		img_Credit.changeimage(path_lolMain.."Credit.BMP")
		img_Credit:SetVisible(1)
	else
		img_Credit:SetVisible(0)
	end

	SetHeroInfo_Credit(num)
	SetGameFight_Credit(num)
end

local TermsOfAgreementUI = nil
-- 设置是否显示用户协议界面
function SetTermsOfAgreementUIVisible(b)
	if TermsOfAgreementUI == nil and b == 1 then
		TermsOfAgreementUI = g_shop_hero_equip_ui:AddImage(path_lolcommon.."common_bg.BMP", 320, 200, 640, 400)
		TermsOfAgreementUI:SetImageFrameWidth(10)
		TermsOfAgreementUI:EnableBlackBackgroundTop(1)
		TermsOfAgreementUI:AddFont("协议条款更新提示\n\n感谢您信任并使用上海跳跃网络科技有限公司及其他合作运营主体的产品和服务。我们依据最新的法律法规、监管政策要求，更新了《上海跳跃网络科技有限公司用户服务协议》，并制作了独立的《隐私政策》，特向您推送本提示。请您仔细阅读并充分理解相关条款。\n\n我们将通过《隐私政策》帮助您了解我们收集、使用、存储和共享个人信息的情况，以及您所享有的相关权利。\n\n您点击“同意”，即表示您已阅读并同意上述协议条款，我们将尽全力保障您的合法权益并继续为您提供优质的产品及服务。\n\n您可通过阅读完整版《上海跳跃网络科技有限公司用户服务协议》和《隐私政策》了解详尽的条款内容。", 15, 8, -20, 50, 600, 400, 0xffffffff)
		
		local Btn_1 = TermsOfAgreementUI:AddImage(path_lolcommon.."common_bg.BMP", 166, 287, 292, 20)
		Btn_1:SetTransparent(0)
		local Font_1 = Btn_1:AddFont("《上海跳跃网络科技有限公司用户服务协议》", 15, 8, 10, 0, 312, 20, 0xffff0000)
		Btn_1.script[XE_LBDOWN] = function()
			XOpenUserAgreementURL("https://passport.jumpw.com/views/serviceprotocol.html")
		end
		Btn_1.script[XE_ONHOVER] = function()
			Font_1:SetFontText("《上海跳跃网络科技有限公司用户服务协议》", 0xffffffff)
		end
		Btn_1.script[XE_ONUNHOVER] = function()
			Font_1:SetFontText("《上海跳跃网络科技有限公司用户服务协议》", 0xffff0000)
		end
		
		local Btn_2 = TermsOfAgreementUI:AddImage(path_lolcommon.."common_bg.BMP", 479, 287, 86, 20)
		Btn_2:SetTransparent(0)
		local Font_2 = Btn_2:AddFont("《隐私政策》", 15, 8, 10, 0, 106, 20, 0xffff0000)
		Btn_2.script[XE_LBDOWN] = function()
			XOpenThePrivacyPolicyURL("https://passport.jumpw.com/views/privacypolicy.html")
		end
		Btn_2.script[XE_ONHOVER] = function()
			Font_2:SetFontText("《隐私政策》", 0xffffffff)
		end
		Btn_2.script[XE_ONUNHOVER] = function()
			Font_2:SetFontText("《隐私政策》", 0xffff0000)
		end
		
		local agree = TermsOfAgreementUI:AddButton(path_lolcommon.."cancel1.BMP", path_lolcommon.."cancel2.BMP", path_lolcommon.."cancel3.BMP", 397, 340, 166, 55)
		agree:AddFont("同意", 15, 8, 0, 0, 166, 55, 0xffffffff)
		agree.script[XE_LBDOWN] = function()
			XReceiveOrRefuseUserAgreement(1)
		end
		
		local refuse = TermsOfAgreementUI:AddButton(path_lolcommon.."cancel1.BMP", path_lolcommon.."cancel2.BMP", path_lolcommon.."cancel3.BMP", 77, 340, 166, 55)
		refuse:AddFont("不同意并退出", 15, 8, 0, 0, 166, 55, 0xffffffff)
		refuse.script[XE_LBDOWN] = function()
			XReceiveOrRefuseUserAgreement(0)
		end
	elseif TermsOfAgreementUI ~= nil then
		TermsOfAgreementUI:SetVisible(b)
	end
end

function GetTermsOfAgreementUiVisible()
	if TermsOfAgreementUI ~= nil and TermsOfAgreementUI:IsVisible() then
		return 1
	else
		return 0
	end
end

-- 设置显示
function SetUpdateWndIsVisible(flag) 
	if UpdateWnd ~= nil then
		if flag >= 1 and GetTermsOfAgreementUiVisible() == 0 then
			UpdateWnd:SetVisible(1)
			
			SetUpdateMenuList(flag)
		elseif flag == 0 then
			UpdateWnd:SetVisible(0)
			XCloseCefButton()
		end
	end
end

function GetUpdateWndIsVisible()
	if UpdateWnd ~= nil and UpdateWnd:IsVisible() then
		return 1
	else
		return 0
	end
end

-- 实名制功能
local real_name_system = nil
local real_name_system_text = nil
local online_time_text = nil
local goto_web_text = nil
local web_change = 0
local real_name_system_font = {
"1.目前，跳跃网络全部游戏产品正陆续接入全新的健康系统，可能会将您在本页面填写的实名信息，以匹配相应的防沉迷规则。若校验不通过，系统会在您登录相关游戏时要求补全实名信息。请以游戏内提示为准。不完善资料将无法进行游戏。\n\n2.实名信息作为帐号归属的判断依据，在帐号申诉时会作为客服参考的重要依据。\n\n3.实名信息设置后不可更改，请认真填写。",

"[健康系统]您暂时不能进行游戏，根据健康系统规则您在每日8时至当日22时，可以进行游戏，请合理安排游戏时间。 \n\n若您对此有疑问，请点击点击下方申诉按钮",

"[健康系统]根据健康系统规则您在每日的游戏累计时长为90分钟，法定节假日每日累计为180分钟。时间累计满了当日将无法进行游戏\n\n若您对此有疑问，请点击点击下方申诉按钮",

"[健康系统]您暂时不能进行游戏，根据健康系统规则您在今日的累计游戏时长已经达到上限，请在次日8时再进行游戏。\n\n若您对此有疑问，请点击点击下方申诉按钮",
}
function set_real_name_system_visible(b, index, font)
	if G_login_ui ~= nil then
		if real_name_system == nil and b == 1 then
			real_name_system = G_login_ui:AddImage(path_lolgame.."soloBK.BMP", 404, 250, 472, 300)
			real_name_system:SetImageFrameWidth(50)
			real_name_system:EnableBlackBackgroundTop(1)
			
			local close_btn = real_name_system:AddButton(path_lolcommon.."close1.BMP",path_lolcommon.."close2.BMP",path_lolcommon.."close3.BMP", 450, -7, 33, 34)
			close_btn.script[XE_LBDOWN] = function()
				real_name_system:SetVisible(0)
			end
			
			online_time_text = real_name_system:AddFont((font or ""), 20, 8, 0, -40, 472, 25, 0xffffffff)
			real_name_system:AddFont("实名认证", 15, 8, 0, 0, 472, 25, 0xffffffff)
			if index == 3 or index == 4 then
				real_name_system_text = real_name_system:AddFont(real_name_system_font[index], 15, 0, 10, 70, 452, 250, 0xffbbc7ff)
				online_time_text:SetVisible(1)
			else
				real_name_system_text = real_name_system:AddFont(real_name_system_font[index], 15, 0, 10, 45, 452, 250, 0xffbbc7ff)
				online_time_text:SetVisible(0)
			end
			real_name_system_text:SetFontSpace(1, 1)
			
			local goto_web = real_name_system:AddButton(path_lolcommon .. "yes1.BMP",path_lolcommon.."yes2.BMP",path_lolcommon.."yes3.BMP", 153, 230, 166, 55)
			goto_web_text = goto_web:AddFont("立即前往认证", 15, 8, 0, 0, 166, 55, 0xffffffff)
			goto_web.script[XE_LBDOWN] = function()
				XRealNameSystemGotoWeb(web_change)
				real_name_system:SetVisible(0)
			end
		elseif real_name_system ~= nil then
			if index == 3 or index == 4 then
				real_name_system_text:SetPosition(10, 70)
				online_time_text:SetVisible(1)
			else
				real_name_system_text:SetPosition(10, 45)
				online_time_text:SetVisible(0)
			end
			real_name_system_text:SetFontText(real_name_system_font[index], 0xffbbc7ff)
			online_time_text:SetFontText((font or ""))
			real_name_system:SetVisible(b)
		end
		
		if goto_web_text ~= nil and index == 1 then
			goto_web_text:SetFontText("立即前往认证")
			web_change = 0
		else
			goto_web_text:SetFontText("立即前往申诉")
			web_change = 1
		end
	end
end

function get_real_name_system_visible()
	if real_name_system ~= nil then
		if real_name_system:IsVisible() then
			return 1
		else
			return 0
		end
	end
end

-- 超级锁提示
local super_lock = nil
local lock_time = nil
local web_link = "http://customer.jumpw.com/"
function SetSuperLockVisible(b, times)
	if G_login_ui ~= nil then
		if super_lock == nil and b == 1 then
			super_lock = G_login_ui:AddImage(path_lolgame.."soloBK.BMP", 404, 250, 472, 300)
			super_lock:SetImageFrameWidth(50)
			super_lock:EnableBlackBackgroundTop(1)
			local close_btn = super_lock:AddButton(path_lolcommon.."close1.BMP",path_lolcommon.."close2.BMP",path_lolcommon.."close3.BMP", 450, -7, 33, 34)
			close_btn.script[XE_LBDOWN] = function()
				super_lock:SetVisible(0)
			end
			super_lock:AddFont("安全提示", 15, 8, 0, 0, 472, 26, 0xffffe684)
			super_lock:AddFont("*由于此账号的信息不匹配，锁定此账号30个自然日", 15, 0, 5, 35, 472, 50, 0xffffffff)
			super_lock:AddFont("锁定日期：", 15, 0, 5, 100, 472, 50, 0xff8580d2)
			lock_time = super_lock:AddFont(times, 15, 0, 80, 100, 472, 50, 0xffff0000)
			super_lock:AddFont("锁定道具：", 15, 0, 5, 120, 472, 50, 0xff8580d2)
			super_lock:AddFont("在此期间无法对背包、材料、仓库、钻石进行操作", 15, 0, 80, 120, 472, 50, 0xffffffff)
			super_lock:AddFont("客服链接：", 15, 0, 5, 140, 472, 50, 0xff8580d2)
			super_lock:AddFont("*可点击客服链接咨询帮助", 15, 8, 0, -190, 472, 50, 0xffffe684)
			super_lock:AddFont("*锁定时间到期后自动解除，给予用户造成的困扰望谅解", 15, 8, 0, -240, 472, 50, 0xffffffff)
			local link_img = super_lock:AddImage(path_lolcommon .. "yes1.BMP", 72, 140, 222, 20)
			link_img:SetTransparent(0)
			local link_font = link_img:AddFont(web_link, 15, 8, 0, 0, 222, 20, 0xffffffff)
			link_img.script[XE_ONHOVER] = function()
				link_font:SetFontText(web_link, 0xff3f48cc)
			end
			link_img.script[XE_ONUNHOVER] = function()
				link_font:SetFontText(web_link, 0xffffffff)
			end
			link_img.script[XE_LBDOWN] = function()
				XOpenWebByString(web_link, 1)
			end
			super_lock:SetVisible(1)
		elseif super_lock ~= nil and b == 1 then
			lock_time:SetFontText(times, 0xffff0000)
			super_lock:SetVisible(1)
		elseif super_lock ~= nil and b == 0 then
			super_lock:SetVisible(0)
		end
	end
end
