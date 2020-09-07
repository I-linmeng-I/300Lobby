include("../Data/Script/Common/include.lua")

local chatInput = nil
local chatInputText = nil
local BTN_random = nil
local BTN_start = nil
local BTN_starteffect = nil
local Effect_Start = {"idle_01","idle_02","idle_03","idle_04"}

local BTN_Random265 = nil
local BTN_Random355 = nil
local BTN_herochose = nil
local BTN_grow = nil
local BTN_SELL = nil



--------英雄框底
local hero_buttom = {}
local hero_controlName = {}
local hero_assistA = {}
local hero_assistB = {}
local hero_head = {} 		--英雄头像
local hero_side = {}
local hero_nameColor = {0xf3c874,0x65c4e7,0x65c4e7,0x65c4e7,0x65c4e7,0x65c4e7,0x65c4e7,0xdc7357,0xdc7357,0xdc7357,0xdc7357,0xdc7357,0xdc7357,0xdc7357}
local hero_sideList = {
path_lolhero.."FR1.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR2.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP",
path_lolhero.."FR6.BMP"}
local hero_hide = {}
local FR1 = {}
local FR2 = {}
local Enter = {}



------------------英雄具体信息
local HeroInfo = {}
HeroInfo.strPictureName = {}	----英雄头像路径
HeroInfo.strName = {}			----英雄名称
HeroInfo.heroId = {}			
HeroInfo.heroTip = {}
------------------信息结束

---------辅助技能窗口
local BTN_SKILL1 = nil
local BTN_SKILL2 = nil



local CueSelHeroId_gamestart = -1

local bgImg = nil
local bgImgHide = nil
local bgImg_SkinLv = nil
local iiiimgFont = nil
local img_BubbleBG = nil
local btn_BubbleSure = nil
local img_TFZJ = nil
local img_TYJN = nil



-----您的队伍UI
local YourTeam_ui,EnemyTeam_ui = nil
local TalentSummonerBK = nil
local Talent_BK,Talent_ui,Talent_pve = nil
local BTN_change = nil
local BTN_LIST = nil
local LIST_BK = nil
local Font_showAll = nil
local SelTalentIndex = 0
local BTN_Talent = {}		--天赋专精下列按钮
local BTN_TalentFont = {"天赋页1","天赋页2","天赋页3","天赋页4","天赋页5","天赋页6","天赋页7","天赋页8","天赋页9","天赋页10",}	--天赋页
local SummonerTalentList = {}


-- 符文系统
local Charm_ui = nil
local BTN_CHARM = nil
local BTN_Charm = {}
local BTN_CharmFont = {"符文页1","符文页2","符文页3","符文页4","符文页5","符文页6","符文页7","符文页8"}--,"符文页9","符文页10","符文页11","符文页12","符文页13","符文页14","符文页15","符文页16" 
local SummonerCharmList = {}
local BTN_CHARMLIST = nil
local CHARMLIST_BK = nil
local CharmFont_showAll = nil
local SelCharmIndex = 1				-- 第几套符文>=1
local MaxCharmPageCount = 0 		-- 玩家拥有的符文页套数
local CurShowCharmIndex = 1 		-- 从符文页的哪个位置开始显示>=1



local Eye_ui = nil--眼界面




local Common_BK,Common_ui,Common_pve = nil
--local PVE_Floor = {}
local Phyattack,Magattack,Dmgadd = nil

--local Skin_ui = nil
--local SKINLEFT,SKINRIGHT = nil

-- PVE
	local pve_BTN_LIST = nil
	local pve_BTN_Talent = {}
	local pve_BTN_TalentFont = {10,9,8,7,6,5,4,3,2,1}
	local pve_Font_showAll = nil
	local pve_LIST_BK = nil
	local pve_SummonerTalentList = {}
	


-- 265地图随机
local RandomCountUI = nil
local BuyRandomCount = nil
local yes_buy = nil
local no_buy = nil
local RandomCount = 0


-- 355地图随机
local RandomPoolCountUI = nil
local BTN_Random355 = nil	-- 随机英雄池
local fnt_RandomCostDesc = nil	-- 随机英雄池花费描述
local fnt_RandomCost = nil	-- 随机英雄池花费
local RandomPoolLeftCount = 0	-- 随机英雄池剩余次数
local RandomPoolCount = 0	-- 随机英雄池次数

local BuyRandomCount355 = nil
local yes_buy355 = nil
local no_buy355 = nil



--新UI
local scissorwnd,scissorwndBG = nil
local CanChoseHero_ui = nil
local ICON_X = {}
local ICON_Y = {}
local HERO_HEAD = {}
local HERO_HIDE = {}
local HERO_SIDE = {}
local HERO_NAME = {}
local HERO_NAMEFONT = {}
local HERO_CLICK = nil
local click_index = 0		-- 被点击的图片

local HEROLISTWNDOPEN = nil
local HeroListWndOpen = {
path_lolhero.."HeroListWndOpen.BMP",
path_lolhero.."HeroListWndOpen1.BMP",
path_lolhero.."HeroListWndOpen2.BMP",
path_lolhero.."HeroListWndOpen3.BMP"}


--英雄搜索
local HeroSearch_ui = nil		
local heroSearchInputEdit = nil
local heronameInput = nil
--滚动条
local hero_toggleImg = nil
local hero_togglebtn = nil
local DownMany = 0

-- 筛选
local HEROTYPE = {}
local HEROTYPECHOSE = {}
local HEROTYPECLOSE = {}
local index_showAll = 1

local TYPELIST = {
path_lolhero.."TYPE1.BMP",
path_lolhero.."TYPE2.BMP",
path_lolhero.."TYPE3.BMP",
path_lolhero.."TYPE4.BMP",
path_lolhero.."TYPE5.BMP",
path_lolhero.."TYPE6.BMP"}

local TYPELIST1 = {
path_lolhero.."TYPE11.BMP",
path_lolhero.."TYPE21.BMP",
path_lolhero.."TYPE31.BMP",
path_lolhero.."TYPE41.BMP",
path_lolhero.."TYPE51.BMP",
path_lolhero.."TYPE61.BMP"}

local TYPELIST2 = {
path_lolhero.."TYPE12.BMP",
path_lolhero.."TYPE22.BMP",
path_lolhero.."TYPE32.BMP",
path_lolhero.."TYPE42.BMP",
path_lolhero.."TYPE52.BMP",
path_lolhero.."TYPE62.BMP"}

-- 排序
local HEROSORT = {}
local HEROSORTCHOSE = {}
local index_oftenUse = 4

local SORTLIST = {
path_lolhero.."SORT1.BMP",
path_lolhero.."SORT2.BMP",
path_lolhero.."SORT3.BMP",
path_lolhero.."SORT4.BMP",
path_lolhero.."SORT5.BMP",
path_lolhero.."SORT6.BMP",
path_lolhero.."SORT7.BMP"}

local SORTLIST1 = {
path_lolhero.."SORT11.BMP",
path_lolhero.."SORT21.BMP",
path_lolhero.."SORT31.BMP",
path_lolhero.."SORT41.BMP",
path_lolhero.."SORT51.BMP",
path_lolhero.."SORT61.BMP",
path_lolhero.."SORT71.BMP"}

local SORTLIST2 = {
path_lolhero.."SORT12.BMP",
path_lolhero.."SORT22.BMP",
path_lolhero.."SORT32.BMP",
path_lolhero.."SORT42.BMP",
path_lolhero.."SORT52.BMP",
path_lolhero.."SORT62.BMP",
path_lolhero.."SORT72.BMP"}

-- 18个具体的英雄信息
local HeroList = {}
HeroList.strPictureName = {}	-- 英雄头像路径
HeroList.strName = {}			-- 英雄名称
HeroList.heroId = {}
HeroList.heroTip = {}
HeroList.IsFavorite = {}

-- 英雄已被选择列表
local BeChosedHeroList = {}
BeChosedHeroList.heroID = {}
local IamReady = 0
local MAXHERO = 300


---血条皮肤-------------------------
local BloodSkinChoosebtn = nil
local BloodSkinChooseFrame = nil

local BloodSkinBack = {}
local BloodSkinName = {}
local BloodSkinpic = {}
local BloodSkinChooseBack = {}
local BloodSkinChooseGou = {}

local BloodSkinInfo = {}
BloodSkinInfo.name = {}
BloodSkinInfo.path = {}
BloodSkinInfo.id = {}

local BloodSkinChooseId = 0

local updownCountBlood = 0
local maxUpdownBlood = 0



function InitGameStart_ui(wnd, bisopen)
	g_game_start_ui = CreateWindow(wnd.id, 0, 0, 1280, 800)
	InitMainGameStart_ui(g_game_start_ui)
	InitMainGameStart_ui2(bgImg)
	g_game_start_ui:SetVisible(bisopen)
end
function InitMainGameStart_ui(wnd)
	--底图背景
	bgImg = wnd:AddImage(path_hero.."ffffff_hero.BMP",0,0,1280,800)
	bgImgHide = bgImg:AddImage(path_lolhero.."hide1.BMP",0,0,1280,800)
	local UPIMG = bgImg:AddImage(path_lolhero.."down.BMP",3000,0,1280,53)
	UPIMG:FlipImage(1,0)
	bgImg:AddImage(path_lolhero.."down.BMP",3000,747,1280,53)
	bgImg:AddImage(path_lolhero.."LU.BMP",0,0,123,78)
	bgImg:AddImage(path_lolhero.."LD.BMP",0,721,227,79)
	bgImg:AddImage(path_lolhero.."RU.BMP",1157,0,123,78)
	bgImg:AddImage(path_lolhero.."RD.BMP",1053,721,227,79)
	bgImg_SkinLv = bgImg:AddImage(path_hero.."skinlv_1.BMP", 980, 23, 300, 143)
	bgImg_SkinLv:SetVisible(0)
	
	
	----我方队伍选择英雄
	YourTeam_ui = CreateWindow(bgImg.id,0,0,580,90)
	for i=1,7 do
	    local y = (i-1)%7+1
		local x = 24
		hero_buttom[i] = YourTeam_ui:AddImage(path_lolhero.."FR8.BMP",x,57*y+150,82,46)
		
		hero_controlName[i] = hero_buttom[i]:AddFont("",12,8,20,-32,120,38,hero_nameColor[i])
		hero_head[i] = YourTeam_ui:AddImage(path_lolhero.."hero.BMP",x+4,57*y+154,74,38)
		hero_side[i] = YourTeam_ui:AddImage(hero_sideList[i],x,57*y+150,82,46)
		hero_side[i]:SetTouchEnabled(0)
		
		-------两个辅助技能
		hero_assistB[i] = hero_side[i]:AddImage(path_equip.."bag_equip.BMP",61+4,17+4,18,18)
		hero_assistA[i] = hero_side[i]:AddImage(path_equip.."bag_equip.BMP",48+4,29+4,18,18)
		FR1[i] = hero_assistB[i]:AddImage(path_lolhero.."FRsummoner.BMP",-1,-1,20,20)
		FR1[i]:SetTouchEnabled(0)
		FR2[i] = hero_assistA[i]:AddImage(path_lolhero.."FRsummoner.BMP",-1,-1,20,20)
		FR2[i]:SetTouchEnabled(0)
		Enter[i] = hero_side[i]:AddImage(path_lolhero.."enter.BMP",1+4,20+4,41,17)
		Enter[i]:SetTouchEnabled(0)
	end

	----敌方队伍选择英雄
	EnemyTeam_ui = CreateWindow(bgImg.id,700,0,580,90)
	for i=8,14 do
	    local y = (i-1)%7+1
		hero_buttom[i] = EnemyTeam_ui:AddImage(path_lolhero.."FR8.BMP",470,57*y+150,82,46)
		hero_controlName[i] = hero_buttom[i]:AddFont("",12,8,20,-40,120,38,hero_nameColor[i])
		
		hero_head[i] = EnemyTeam_ui:AddImage(path_lolhero.."hero.BMP",474,57*y+150+4,74,38)
		hero_side[i] = EnemyTeam_ui:AddImage(hero_sideList[i],470,57*y+150,82,46)
		hero_side[i]:SetTouchEnabled(0)
		
		-------两个辅助技能
		hero_assistB[i] = hero_side[i]:AddImage(path_equip.."bag_equip.BMP",61+4,17+4,18,18)
		hero_assistA[i] = hero_side[i]:AddImage(path_equip.."bag_equip.BMP",48+4,29+4,18,18)
		FR1[i] = hero_assistB[i]:AddImage(path_lolhero.."FRsummoner.BMP",-1,-1,20,20)
		FR1[i]:SetTouchEnabled(0)
		FR2[i] = hero_assistA[i]:AddImage(path_lolhero.."FRsummoner.BMP",-1,-1,20,20)
		FR2[i]:SetTouchEnabled(0)
		Enter[i] = hero_side[i]:AddImage(path_lolhero.."enter.BMP",1+4,30+4,41,17)
		Enter[i]:SetTouchEnabled(0)
	end

	-- 可供选择的英雄列表
	CanChoseHero_ui = CreateWindow(bgImg.id, 285, 0, 500, 500)
	scissorwnd = CreateWindow(CanChoseHero_ui.id, 50, 120, 500, 500)
	scissorwnd:SetTouchEnabled(1)
	scissorwnd:SetWindowScissorRect(10, 25, 650, 465)
	scissorwndBG = CreateWindow(scissorwnd.id, 0, 0, 500, 465)
	for i = 1,MAXHERO do 
		ICON_X[i] = 85*((i-1)%7)+15
		ICON_Y[i] = 62*math.ceil(i/7)-34+24*(math.ceil(i/14)-1)
		
		-- 头像
		HERO_HEAD[i] = scissorwndBG:AddImage(path_lolhero.."hero.BMP",ICON_X[i],ICON_Y[i],74,38)---原来是256，暂时修改成148
		-- 遮罩
		HERO_HIDE[i] = HERO_HEAD[i]:AddImage(path_lolhero.."FR3.BMP",-4,-4,82,46)		
		-- 边框
		HERO_SIDE[i] = HERO_HEAD[i]:AddImage(path_lolhero.."FR5.BMP",-4,-4,82,46)
		HERO_SIDE[i]:SetTouchEnabled(0)
		-- 名字
		HERO_NAME[i] = HERO_HEAD[i]:AddImage(path_lolhero.."nameBK.BMP",0,42,74,14)
		HERO_NAMEFONT[i] = HERO_NAME[i]:AddFont("", 12, 8, 40, 0, 150, 14, 0xffbcc9ff)
		
		HERO_HEAD[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_hero_index_new)			
			WND_WAKEUP:SetVisible(0)
			XSetHeroGrowthUpUiVisible(0, 0)
			-- 标记点击的图片
			if GetStepIndex_Tutorial()==9 then
				XClickOkButtonTutorial()
			end
			
			-- click_index = i
			-- local Lh,Th = HERO_SIDE[i]:GetPosition()
			-- HERO_CLICK:SetAbsolutePosition(Lh,Th)
			-- HERO_CLICK:SetVisible(1)
			
			XGameHeroChoseId(HeroList.heroId[i])
		end	
		HERO_HEAD[i].script[XE_ONHOVER] = function()
		    XClickPlaySound(UI_hero_magnet_new)
			HERO_SIDE[i].changeimage(path_lolhero.."FR1.BMP")
		end
		HERO_HEAD[i].script[XE_ONUNHOVER] = function()
			HERO_SIDE[i].changeimage(path_lolhero.."FR5.BMP")
		end		
	end
	
	-- 黄色高亮(只画一个，移动位置)
	-- HERO_CLICK = CanChoseHero_ui:AddImage(path_lolhero.."FR5.BMP",-4,-4,82,46)
	-- HERO_CLICK:SetTouchEnabled(0)
	-- HERO_CLICK:SetVisible(0)
	
	
	HEROLISTWNDOPEN = bgImg:AddButton(HeroListWndOpen[1],HeroListWndOpen[2],HeroListWndOpen[1],32,118,28,28)
	HEROLISTWNDOPEN.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		if CanChoseHero_ui:IsVisible()==true then
			bgImgHide:SetVisible(0)
			CanChoseHero_ui:SetVisible(0)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,0)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[2], Wnd_Button ,1)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,2)
		else
			bgImgHide:SetVisible(1)
			CanChoseHero_ui:SetVisible(1)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,0)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[4], Wnd_Button ,1)
			XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,2)
		end
	end
		
	--英雄搜索
	HeroSearch_ui =  CreateWindow(HEROLISTWNDOPEN.id, -32, -118, 100, 50)	
	heroSearchInputEdit = CreateWindow(HeroSearch_ui.id, 67, 118, 157, 28)
	heronameInput = heroSearchInputEdit:AddEdit(path_lolhero.."search.BMP","","StartChoseHero_OnSearchEnter","",13,5,5,135,25,0xffffffff,0xff000000,0,"")
	XEditSetMaxByteLength(heronameInput.id,20)
	--heronameInput:SetDefaultFontText("搜索", 0xff303b4a)
	
	-- 显示滚动条
	hero_toggleImg = CanChoseHero_ui:AddImage(path_lolhero.."toggleBK_main.BMP",673,160,1,459)
	hero_togglebtn = hero_toggleImg:AddButton(path_lolhero.."toggleBTN1_main.BMP",path_lolhero.."toggleBTN2_main.BMP",path_lolhero.."toggleBTN3_main.BMP",-2,0,5,142)
	local ToggleT = hero_toggleImg:AddImage(path_lolhero.."TD1_main.BMP",-3,-9,7,9)
	local ToggleD = hero_toggleImg:AddImage(path_lolhero.."TD2_main.BMP",-3,459,7,9)
	
	XSetWindowFlag(hero_togglebtn.id,1,1,0,317)
	
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
			DownMany = T
			if DownMany<0 then
				DownMany  = 0
			end
			local distanc = T/317*(62*math.ceil(#HeroList.strName/7)+100+24*(math.ceil(#HeroList.strName/14)-1)-162)
			
			local L1,T1,R1,B1 = XGetWindowClientPosition(scissorwndBG.id)
			scissorwndBG._T = T1
			local imgpos = (0 - distanc)
			if imgpos > 0 then
				imgpos = 0
			end
			if imgpos < -5000 then
				imgpos = -5000
			end	
			scissorwndBG:SetPosition(0,imgpos)
		end
	end
		
	-- 设置界面可以滑动
	bgImg:EnableEvent(XE_MOUSEWHEEL)
	bgImg.script[XE_MOUSEWHEEL] = function()
		if g_game_start_ui:IsVisible() == false then
		    return
		end
		if #HeroList.strName<=42 then
			return
		end
		local move = (62*math.ceil(#HeroList.strName/7)+100+24*(math.ceil(#HeroList.strName/14)-1)-162)
		
		local updownMove = 0
		local updown = XGetMsgParam0()
		if updown>0 then
			updownMove = -1*math.ceil(317/100)
		else
			updownMove = math.ceil(317/100)
		end
		
	    local btn_pos = hero_togglebtn._T + updownMove
		if btn_pos < 0 then
		   btn_pos = 0
		end
		if btn_pos >317 then
		   btn_pos = 317
		end		
		DownMany = btn_pos
		hero_togglebtn:SetPosition(-2,btn_pos)
		hero_togglebtn._T = btn_pos
		
		local distanc = (btn_pos*move)/317
		local BGmove = (0 - distanc)
		if BGmove > 0 then
		    BGmove = 0
		end
		if BGmove < -5000 then
		    BGmove = -5000
		end	
		scissorwndBG:SetPosition(0,BGmove)		
	end
	
	-- 筛选	
	for i=1,6 do
		local px = 89*i-31
		if i>3 then
			px = px+91
		end
		
		HEROTYPE[i] = CanChoseHero_ui:AddButton(TYPELIST[i],TYPELIST1[i],TYPELIST[i],px,645,66,28)
		HEROTYPE[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			
			for m,n in pairs(HEROTYPECHOSE) do
				if m==i then
					HEROTYPECHOSE[m]:SetVisible(1)
					HEROTYPE[m]:SetVisible(0)
				else
					HEROTYPECHOSE[m]:SetVisible(0)
					HEROTYPE[m]:SetVisible(1)
				end
			end
			
			index_showAll = i+1
			StartChoseHero_OnSearchEnter()
		end
		
		HEROTYPECHOSE[i] = CanChoseHero_ui:AddImage(TYPELIST2[i],px,645,66,28)
		HEROTYPECHOSE[i]:SetVisible(0)		
		HEROTYPECHOSE[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			HEROTYPECHOSE[i]:SetVisible(0)
			HEROTYPE[i]:SetVisible(1)
			
			index_showAll = 1
			StartChoseHero_OnSearchEnter()			
		end
		
		
		HEROTYPECLOSE[i] = HEROTYPECHOSE[i]:AddButton(path_lolhero.."sclose1.BMP",path_lolhero.."sclose2.BMP",path_lolhero.."sclose3.BMP",61,-12,15,15)	
		HEROTYPECLOSE[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			HEROTYPECHOSE[i]:SetVisible(0)
			HEROTYPE[i]:SetVisible(1)
			
			index_showAll = 1
			StartChoseHero_OnSearchEnter()			
		end
	end
	
	
	-- 排序
	for i=1,7 do
		local px = 89*i-31
		
		HEROSORT[i] = CanChoseHero_ui:AddButton(SORTLIST[i],SORTLIST1[i],SORTLIST[i],px,694,66,28)
		HEROSORT[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			
			for m,n in pairs(HEROSORTCHOSE) do
				if m==i then
					HEROSORTCHOSE[m]:SetVisible(1)
					HEROSORT[m]:SetVisible(0)
				else
					HEROSORTCHOSE[m]:SetVisible(0)
					HEROSORT[m]:SetVisible(1)
				end
			end
			
			index_oftenUse = i
			StartChoseHero_OnSearchEnter()
		end
		
		HEROSORTCHOSE[i] = CanChoseHero_ui:AddImage(SORTLIST2[i],px,694,66,28)
		HEROSORTCHOSE[i]:SetVisible(0)	
	end
	
	-- 随机英雄出击
	BTN_random = CanChoseHero_ui:AddButton(path_lolhero.."random1_start.BMP", path_lolhero.."random2_start.BMP", path_lolhero.."random3_start.BMP",321,630,78,42)
	BTN_random.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		if XGetMapId() == 25 and RandomCount == 0 then
			BuyRandomCount:SetVisible(1)
		else
			XGameHeroRandom(1)
			SetWakeUpButtonEnable(1)
		end
	end
	
	
end

function InitMainGameStart_ui2(wnd)
	---------英雄选择界面
	bgImg:AddImage(path_lolhero.."talentsummonerbk_start.BMP",3000,155,472,250)
	bgImg:AddImage(path_lolhero.."talentsummonerbk_start.BMP",3000,405,472,250)
	
	
	-- 出击
	BTN_start = bgImg:AddImage(path_lolhero.."readyEnter1_start.BMP",515, 739-OffsetY2_Start, 251, 59)
	-- BTN_start:SetTransparent(0)
	BTN_start.script[XE_LBUP] = function()
		XClickPlaySound(UI_startgame_new)
		
		XGameHeroStart()
	end
	
	BTN_starteffect = BTN_start:AddEffect("../Data/Magic/Common/UI/changwai/chuji/tx_UI_CW_chuji_01.x",515+129,739+25-OffsetY2_Start,1280,800)
	BTN_starteffect:SetTouchEnabled(0)
	
	BTN_start.script[XE_ONHOVER] = function()
		if IamReady==0 then
			XPlayEffectByName(BTN_starteffect.id, Effect_Start[2],0)
		end
	end
	BTN_start.script[XE_ONUNHOVER] = function()
		if IamReady==0 then
			XPlayEffectByName(BTN_starteffect.id, Effect_Start[1],0)
		end
	end
	
	BTN_Random265 = bgImg:AddButton(path_lolhero.."random1.BMP", path_lolhero.."random2.BMP", path_lolhero.."random3.BMP",230, 107, 175, 50)
	
	BTN_Random265:SetVisible(0)
	BTN_Random265.script[XE_LBUP] = function()
		XClickPlaySound(UI_startgame_new)
		
		if XGetMapId() == 25 and RandomCount == 0 then
			BuyRandomCount:SetVisible(1)
		else
			XGameHeroRandom(1)
			SetWakeUpButtonEnable(1)
		end
	end
	
	-- 265乱斗无双 随机次数
	RandomCountUI = BTN_Random265:AddFont("随机英雄( 0 )", 15, 8, 0, 0, 175, 50, 0xffffff)	
	
	-- 花钱随机
	BuyRandomCount = bgImg:AddImage(path_lolgame.."soloBK.BMP",431,404,417,272)
	BuyRandomCount:SetImageFrameWidth(50)
	BuyRandomCount:EnableBlackBackgroundTop(1)
	BuyRandomCount:AddFont("是否消耗1钻石重新随机英雄？",  15, 0, 25, 45, 365, 100, 0xffffff)
	BuyRandomCount:AddFont("购买方式", 15, 8, 0, 0, 417, 272, 0xffffff)

	BuyRandomCount:AddImage(path_lolcommon.."gold.BMP", 170, 170, 38, 38)
	BuyRandomCount:AddFont("1", 15, 0, 208, 175, 100, 20, 0x7cceda)
	
	yes_buy = BuyRandomCount:AddButton(path_lolcommon .. "cancel1.BMP",path_lolcommon .. "cancel2.BMP",path_lolcommon .. "cancel3.BMP",46,250,130,43)	
	yes_buy:AddFont("是", 15,8,0,0,130,43,0xffffff)
	yes_buy.script[XE_LBUP] = function()
		XGameHeroRandom(1)
		BuyRandomCount:SetVisible(0)
	end
	
	no_buy = BuyRandomCount:AddButton(path_lolcommon .. "yes1.BMP",path_lolcommon.."yes2.BMP",path_lolcommon.."yes3.BMP",243,250,130,43)	
	no_buy:AddFont("否", 15,8,0,0,130,43,0xffffff)
	no_buy.script[XE_LBUP] = function()
		BuyRandomCount:SetVisible(0)
	end
	
	BuyRandomCount:SetVisible(0)
	
	-- 355吃鸡地图 随机英雄池
	-- 355随机英雄
	BTN_Random355 = bgImg:AddButton(path_lolhero.."random1.BMP", path_lolhero.."random2.BMP", path_lolhero.."random3.BMP",230, 107, 175, 50)
	-- 随机次数	
	RandomPoolCountUI = BTN_Random355:AddFont("随机英雄池( 0 )", 15, 8, 0, 0, 175, 50, 0xffffff)
	BTN_Random355:SetVisible(0)
	BTN_Random355.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if RandomPoolLeftCount == 0 then
			BuyRandomCount355:SetVisible(1)
			local n = 5 * (RandomPoolCount + 1)
			fnt_RandomCostDesc:SetFontText("是否消耗"..n.."个钻石重新随机英雄池？", 0xffffff)
			fnt_RandomCost:SetFontText(""..n, 0x7cceda)
		else
			XGameHeroPoolRandom()
		end
	end
	BTN_Random355:SetVisible(0)
	
	
	-- 花钱随机
	BuyRandomCount355 = bgImg:AddImage(path_lolgame.."soloBK.BMP",431,404,417,272)
	BuyRandomCount355:SetImageFrameWidth(50)
	BuyRandomCount355:EnableBlackBackgroundTop(1)
	fnt_RandomCostDesc = BuyRandomCount355:AddFont("是否消耗1钻石重新随机英雄？", 15, 0, 25, 45, 365, 100, 0xffffff)
	BuyRandomCount355:AddFont("购买方式", 15, 8, 0, 0, 417, 272, 0xffffff)

	BuyRandomCount355:AddImage(path_lolcommon.."gold.BMP", 170, 170, 38, 38)
	fnt_RandomCost = BuyRandomCount355:AddFont("1", 15, 0, 208, 175, 100, 20, 0x7cceda)
	
	yes_buy355 = BuyRandomCount355:AddButton(path_lolcommon .. "cancel1.BMP",path_lolcommon .. "cancel2.BMP",path_lolcommon .. "cancel3.BMP",46,250,130,43)	
	yes_buy355:AddFont("是", 15,8,0,0,130,43,0xffffff)
	yes_buy355.script[XE_LBUP] = function()
		XGameHeroPoolRandom()
		BuyRandomCount355:SetVisible(0)
	end
	
	no_buy355 = BuyRandomCount355:AddButton(path_lolcommon .. "yes1.BMP",path_lolcommon.."yes2.BMP",path_lolcommon.."yes3.BMP",243,250,130,43)	
	no_buy355:AddFont("否", 15,8,0,0,130,43,0xffffff)
	no_buy355.script[XE_LBUP] = function()
		BuyRandomCount355:SetVisible(0)
	end
	
	BuyRandomCount355:SetVisible(0)
	
end
--y眼皮肤 修改icon
function SetSide3Pic(picPath,tip)	
	Eye_ui.changeimage(picPath)
	Eye_ui:SetImageTip(tip)
end

-- 按照ID查找英雄详细信息发给start界面
function FindHeroInfoSendToStart(strPictureName,strName,HeroId,tip,index)	
	local size = index+1	
	
	HeroInfo.strPictureName[size] = strPictureName							--log("\nFindHeroInfoSendToStart   -1")--1
	HeroInfo.strName[size] = strName										--log("\nFindHeroInfoSendToStart   -2")--2
	HeroInfo.heroId[size] = HeroId											--log("\nFindHeroInfoSendToStart   -9")
	HeroInfo.heroTip[size] = tip	
	hero_head[size].changeimage(HeroInfo.strPictureName[size])				--log("\nFindHeroInfoSendToStart   -10")
	hero_head[size]:SetImageTip(HeroInfo.heroTip[size])
	hero_head[size]:SetVisible(1)
	
	hero_assistA[size]:SetVisible(1)
	hero_assistB[size]:SetVisible(1)
end
-- 队友谁出击了
function Teammates_StartGame(index)
	if index >0 and index <8 then
		if index==1 then
			hero_side[index].changeimage(path_lolhero.."FR5.BMP")
		else
			hero_side[index].changeimage(path_lolhero.."FR4.BMP")
		end
		Enter[index]:SetVisible(1)
	end
end
-- 我出击了
function IamReady_StartGame()
	IamReady = 1
	
	bgImgHide:SetVisible(0)
	CanChoseHero_ui:SetVisible(0)
	XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,0)
	XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[2], Wnd_Button ,1)
	XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,2)
	
	XPlayEffectByName(BTN_starteffect.id, Effect_Start[3],0)
	BTN_start:SetTimer(0,2000,0,1).Timer = function(timer,interval)
		
		BTN_start:KillTimer(0)
		XPlayEffectByName(BTN_starteffect.id, Effect_Start[4],0)
	end		
end

function Hero_AssistSkill(assistA,assistB,tip1,tip2,index)
	local size = index+1
	hero_assistA[size].changeimage("..\\"..assistA)
	hero_assistB[size].changeimage("..\\"..assistB)
	hero_assistA[size]:SetImageTip(tip1)
	hero_assistB[size]:SetImageTip(tip2)
end
-- 修改第一个Master技能summonerSkill.lua
function Start_SummonerSkillA(assistA,tip1)
	BTN_SKILL1.changeimage(assistA)
	BTN_SKILL1:SetImageTip(tip1)
end
-- 修改第二个Master技能summonerSkill.lua
function Start_SummonerSkillB(assistB,tip2)				
	BTN_SKILL2.changeimage(assistB)
	BTN_SKILL2:SetImageTip(tip2)
end

function Init_TeamplayerName(name,index)
	--log("\nname = index = "..name.."   "..index)
	if index>=0 and index<=6 then		
		hero_controlName[index+1]:SetFontText(name,hero_nameColor[index+1])
	end
end
-- 复原到匹配成功的初始化状态
function RecoverStartList()	
	--log("\nRecoverStartList   0")
	for index,value in pairs(hero_head) do
		hero_head[index]:SetVisible(0)
		--hero_hide[index]:SetVisible(1)
		hero_controlName[index]:SetFontText("",hero_nameColor[index])
		hero_assistA[index].changeimage(path_equip.."bag_equip.BMP")
		hero_assistB[index].changeimage(path_equip.."bag_equip.BMP")
		hero_side[index].changeimage(hero_sideList[index])
		Enter[index]:SetVisible(0)
	end
		
	-- 英雄信息表
	HeroInfo = {}					-- 清除发送来的信息
	HeroInfo.strPictureName = {}	-- 英雄头像路径
	HeroInfo.strName = {}			-- 英雄名称
	HeroInfo.heroId = {}
	HeroInfo.heroTip = {}

	heronameInput:SetEdit("")
	index_showAll = 1
	index_oftenUse = 4
	IamReady = 0
	for m,n in pairs(HEROTYPECHOSE) do
		HEROTYPE[m]:SetVisible(1)
		HEROTYPECHOSE[m]:SetVisible(0)
	end
	for m,n in pairs(HEROSORTCHOSE) do
		if m==index_oftenUse then
			HEROSORTCHOSE[m]:SetVisible(1)
			HEROSORT[m]:SetVisible(0)
		else
			HEROSORTCHOSE[m]:SetVisible(0)
			HEROSORT[m]:SetVisible(1)
		end
	end
	
	--已被选择英雄ID
	BeChosedHeroList = {}
	BeChosedHeroList.heroID = {}
	
	
	GameStart_IsReady(0)
end

function GameStart_IsReady(ready)
	if ready == 0 then	--尚未出击恢复可点击状态		
		BTN_change:SetEnabled(1)
		BTN_LIST:SetEnabled(1)
		LIST_BK:SetVisible(0)
		BTN_CHARM:SetEnabled(1)
		BTN_CHARMLIST:SetEnabled(1)
		CHARMLIST_BK:SetVisible(0)
		pve_BTN_LIST:SetEnabled(1)
		pve_LIST_BK:SetVisible(0)
		BTN_SKILL1:SetEnabled(1)
		BTN_SKILL2:SetEnabled(1)
		Eye_ui:SetEnabled(1)		
		GameSkin_IsReady(1)
	else				--出击
		BTN_change:SetEnabled(0)
		BTN_LIST:SetEnabled(0)
		LIST_BK:SetVisible(0)
		BTN_CHARM:SetEnabled(0)
		BTN_CHARMLIST:SetEnabled(0)
		CHARMLIST_BK:SetVisible(0)
		pve_BTN_LIST:SetEnabled(0)
		pve_LIST_BK:SetVisible(0)
		BTN_SKILL1:SetEnabled(0)
		BTN_SKILL2:SetEnabled(0)
		Eye_ui:SetEnabled(0)
		GameSkin_IsReady(0)
		
		SetTalent_InsideIsVisible(0)
		SetCharm_InsideIsVisible(0)
		SetSummonerSkillIsVisible(0)
		SetEyeSelectIsVisible(0)
		SetShopBuyIsVisible(0)
	end
end


-- 不可以点击界面
function RandomStartDisabled()
	-- log("\nBTN_random:SetEnabled" .. 0)
	BTN_random:SetEnabled(0)
	BTN_start:SetEnabled(0)
end


function ClearTalentList_gamestart()	
	BTN_TalentFont = {}
	Font_showAll:SetFontText("", 0xfec479)
	LIST_BK:SetVisible(0)
	BTN_LIST:SetButtonFrame(0)
	for index,value in pairs(BTN_Talent) do
		BTN_Talent[index]:SetVisible(0)
	end
	for index,value in pairs(SummonerTalentList) do
		SummonerTalentList[index]:SetVisible(0)
	end
end

function SetLastSelTalent_gamestart( cTalentName, cIndex)
	SelTalentIndex = cIndex
	Font_showAll:SetFontText( cTalentName, 0xfec479)	
end

function SetTalentListCount_gamestart(allcount)
	LIST_BK:SetWH(186,2+29*allcount)
	
	for dis = 1,dAllCount do
		BTN_Talent[dis]:SetPosition(1,dis*29-28)
		SummonerTalentList[dis]:SetPosition(40,dis*29-23)
	end
	
end

function SetSummonerTalentListInfor_gamestart( cTalentName)
		local index = #BTN_TalentFont+1
		BTN_TalentFont[index] = cTalentName
		BTN_Talent[index]:SetVisible(1)
		SummonerTalentList[index]:SetFontText(cTalentName, 0xfec479)
		SummonerTalentList[index]:SetVisible(1)
end

function SetWndBgImg_gamestart(cpath, lv)
	bgImg.changeimage(cpath)
	if lv==0 then
		bgImg_SkinLv:SetVisible(0)
	else
		bgImg_SkinLv:SetVisible(1)
		bgImg_SkinLv.changeimage(path_hero.."skinlv_"..lv..".BMP")
	end
end

function SetGameStart_CurrentHeroId(id)
	CueSelHeroId_gamestart = id
	SetCurTitleState_teadytime(0)
end

function SetGameStart_BackGround(path,skinlv)
	if XGetMapId()==BANPICK_WAITROOM then
		SetBanPick_BackGround(path,skinlv)
	elseif XGetMapId()==RANK_WAITROOM then
		SetRank_BackGround(path,skinlv)
	else
		SetWndBgImg_gamestart(path,skinlv)
	end
		
	SetLoadingTexture(path)	
end

function SetGameStartTutorialState( cIsEnable, cId)
	-- if cId==1 then
		-- hero_side[1]:EnableImageAnimateEX(cIsEnable, 11, 90, 0, 0, 0, 0)
	-- elseif cId==2 then
		-- hero_side[1]:EnableImageAnimateEX(cIsEnable, 11, 90, -90, 0, 510, 0)
	-- elseif cId==3 then
		-- hero_side[2]:EnableImageAnimateEX(cIsEnable, 11, 90, 80, -320, 410, 360)
	-- elseif cId==4 then
		-- iiiimgFont:EnableImageAnimateEX(cIsEnable, 7, 90, 20, 120, -20, -120)
	-- elseif cId==5 then
		-- img_TFZJ:EnableImageAnimateEX(cIsEnable, 11, 90, 10, 5, -55, 70)
	-- elseif cId==6 then
		-- img_TYJN:EnableImageAnimateEX(cIsEnable, 11, 90, 10, 5, -55, 70)
	-- else
	
	-- end
end

function SetTutorialButtonEnable(IsEnable)
-- log("\nSetTutorialButtonEnable  "..IsEnable)
	BTN_random:SetEnabled(IsEnable)
	BTN_start:SetEnabled(IsEnable)
	BTN_change:SetEnabled(IsEnable)
	BTN_SKILL1:SetTouchEnabled(IsEnable)
	BTN_SKILL2:SetTouchEnabled(IsEnable)
	Eye_ui:SetTouchEnabled(IsEnable)
	BTN_LIST:SetTouchEnabled(IsEnable)
	
	-- if IsEnable==1 then
		-- SetGameStartIsVisible(0)
	-- end
end

function SetTutorialAllButtonEnable(IsEnable)
-- log("\nSetTutorialAllButtonEnable  "..IsEnable)
	BTN_random:SetEnabled(IsEnable)
	BTN_start:SetEnabled(IsEnable)
	BTN_change:SetEnabled(IsEnable)
	BTN_SKILL1:SetTouchEnabled(IsEnable)
	BTN_SKILL2:SetTouchEnabled(IsEnable)
	Eye_ui:SetTouchEnabled(IsEnable)
	BTN_LIST:SetTouchEnabled(IsEnable)
end


-- 显示符文
function SetStart_DestMapID(mapid,talent,charm,common,eye)
log("\nSetStart_DestMapID mapid = "..mapid)
	-- 是否可以选择天赋
	
	Talent_ui:SetVisible(talent)
	if bForbidCharm==0 then
		Charm_ui:SetVisible(0)
	else
		Charm_ui:SetVisible(charm)
	end	
	Common_ui:SetVisible(common)
	Eye_ui:SetVisible(eye)
	
	if mapid==252 then
		Common_pve:SetVisible(0)
		Talent_pve:SetVisible(0)		
	elseif mapid==262 then
		Common_pve:SetVisible(1)
		Talent_pve:SetVisible(1)
	elseif mapid==355 then		
		Common_pve:SetVisible(0)
		Talent_pve:SetVisible(0)
	else		
		Common_pve:SetVisible(0)
		Talent_pve:SetVisible(0)
	end	
end


function PVE_MaxFloorNum(Maxlevel,nowLevel)
	pve_LIST_BK:SetWH(186,2+29*Maxlevel)
	
	for dis = 1,Maxlevel do
		pve_BTN_Talent[dis]:SetPosition(1,dis*29-28)
		pve_SummonerTalentList[dis]:SetPosition(40,dis*29-23)
	end
	
	--通属性
	local level = Maxlevel
	if level >0 then
	    pve_Font_showAll:SetFontText(nowLevel,0xfec479)
	else
	    pve_Font_showAll:SetFontText(1,0xfec479)	
	end
	for dis = 1,10 do
	    if level <= 0 then
		    pve_BTN_Talent[dis]:SetVisible(0)
			pve_BTN_TalentFont[dis] = level
			pve_SummonerTalentList[dis]:SetFontText(pve_BTN_TalentFont[dis],0xfec479)
			pve_SummonerTalentList[dis]:SetVisible(0)
			level=level-1
		else
		    pve_BTN_Talent[dis]:SetVisible(1)
			pve_BTN_TalentFont[dis] = level
			pve_SummonerTalentList[dis]:SetFontText(pve_BTN_TalentFont[dis],0xfec479)
			pve_SummonerTalentList[dis]:SetVisible(1)
		    level=level-1
        end		
	end
end

function PVE_SetBaseInfo(pa,ma,da)
    --通属性
	Phyattack:SetFontText( pa, 0x45b1c9)
	Magattack:SetFontText( ma, 0x45b1c9)
	local info = string.format("%.2f",da).."%"
	Dmgadd:SetFontText( info, 0x45b1c9)
end



function IsFocusOn_Start()
	if (g_game_start_ui:IsVisible() == true) then
		local flagA = LIST_BK:IsVisible() == true and BTN_LIST:IsFocus() == false and BTN_Talent[1]:IsFocus() == false and BTN_Talent[2]:IsFocus() == false
		and BTN_Talent[3]:IsFocus() == false and BTN_Talent[4]:IsFocus() == false and BTN_Talent[5]:IsFocus() == false and BTN_Talent[6]:IsFocus() == false
		and BTN_Talent[7]:IsFocus() == false and BTN_Talent[8]:IsFocus() == false and BTN_Talent[9]:IsFocus() == false and BTN_Talent[10]:IsFocus() == false

		if(flagA == true) then
			BTN_LIST:SetButtonFrame(0)
			LIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Talent) do
				BTN_Talent[index]:SetTransparent(0)
				BTN_Talent[index]:SetTouchEnabled(0)
			end
		end

		
		local flagB = CHARMLIST_BK:IsVisible() == true and BTN_CHARMLIST:IsFocus() == false and BTN_Charm[1]:IsFocus() == false and BTN_Charm[2]:IsFocus() == false
		and BTN_Charm[3]:IsFocus() == false and BTN_Charm[4]:IsFocus() == false and BTN_Charm[5]:IsFocus() == false and BTN_Charm[6]:IsFocus() == false
		and BTN_Charm[7]:IsFocus() == false and BTN_Charm[8]:IsFocus() == false

		if(flagB == true) then
			BTN_CHARMLIST:SetButtonFrame(0)
			CHARMLIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Charm) do
				BTN_Charm[index]:SetTransparent(0)
				BTN_Charm[index]:SetTouchEnabled(0)
			end
		end
	end
end



--设置显示
function SetGameStartIsVisible(flag) 
	if g_game_start_ui ~= nil then
		if flag == 1 and g_game_start_ui:IsVisible() == false then
			g_game_start_ui:CreateResource()
			g_game_start_ui:SetVisible(1)
			
			XCheckifShowBLoodSkinBtn()
			
			SetFourpartUIVisiable(10)
			-- 设置皮肤框是否显示和位置
			SetSkinWindowPos(1)
			SetGameSkinFrameIsVisible(1)
			SetGameTalentFrameIsVisible(1)
			--SetGameStartChatUiVisible(1)
			--SetGameStartChatInputIsVisible(1)
			
			SwitchGameStartMode()
			
			XInGameLog("act=WINDOW,Function=SetGameStartIsVisible,visible=true")
		elseif flag == 0 and g_game_start_ui:IsVisible() == true then
			g_game_start_ui:DeleteResource()
			g_game_start_ui:SetVisible(0)
			WND_WAKEUP:SetVisible(0)
			--SetGameStartChatUiVisible(0)
			--SetGameStartChatInputIsVisible(0)
			
			SwitchCommonMode()
			
			--XInGameLog("act=WINDOW,Function=SetGameStartIsVisible,visible=false")
		end
	end
	
end

function GetGameStartIsVisible()
	if ( g_game_start_ui ~= nil and g_game_start_ui:IsVisible() ) then
		return 1
	else
		return 0
	end
end

function InitGameStartMode(mapid)
	if XGetMapId() == 27 then
		BTN_random:SetVisible(1)
		BTN_random:SetEnabled(1)
		BTN_Random265:SetVisible(0)
		BTN_Random355:SetVisible(1)
		
		bgImgHide:SetVisible(1)
		CanChoseHero_ui:SetVisible(1)
		HEROLISTWNDOPEN:SetVisible(1)
		HEROLISTWNDOPEN:SetEnabled(1)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,0)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[4], Wnd_Button ,1)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,2)
	elseif XGetMapId() == 25 then
		BTN_random:SetVisible(1)
		BTN_random:SetEnabled(0)
		BTN_Random265:SetVisible(1)
		BTN_Random355:SetVisible(0)
		
		bgImgHide:SetVisible(0)		
		CanChoseHero_ui:SetVisible(0)
		HEROLISTWNDOPEN:SetVisible(1)
		HEROLISTWNDOPEN:SetEnabled(0)		
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,0)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[2], Wnd_Button ,1)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[1], Wnd_Button ,2)
	else
		BTN_random:SetVisible(1)
		BTN_random:SetEnabled(1)
		BTN_Random265:SetVisible(0)
		BTN_Random355:SetVisible(0)
		
		bgImgHide:SetVisible(1)
		CanChoseHero_ui:SetVisible(1)
		HEROLISTWNDOPEN:SetVisible(1)
		HEROLISTWNDOPEN:SetEnabled(1)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,0)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[4], Wnd_Button ,1)
		XChangeImage(HEROLISTWNDOPEN.id, HeroListWndOpen[3], Wnd_Button ,2)
	end
	
	if mapid == 265 then
		XGameHeroRandom(1)
	else
	
	end
	
	if BuyRandomCount~=nil then
		BuyRandomCount:SetVisible(0)
	end
	if BuyRandomCount355~=nil then
		BuyRandomCount355:SetVisible(0)
	end
	
	for i,v in pairs(hero_assistA) do
		hero_assistA[i]:SetVisible(0)
		hero_assistA[i]:SetImageTip(0)
		hero_assistB[i]:SetVisible(0)
		hero_assistB[i]:SetImageTip(0)
	end
	
	XPlayEffectByName(BTN_starteffect.id, Effect_Start[1],0)	
	
end

function SetRandomCount(count)
	RandomCount = count
	if BTN_Random265 ~= nil then
		if count == 0 then
			RandomCountUI:SetFontText("随机英雄",0xffffff)
		else
			RandomCountUI:SetFontText("随机英雄( "..count.." )",0xffffff)
		end
	end
end


function SetRandomPoolCount(leftcount, count)
	RandomPoolLeftCount = leftcount
	RandomPoolCount = count
	if RandomPoolCountUI ~= nil then
		if leftcount == 0 then
			RandomPoolCountUI:SetFontText("随机英雄池",0xffffff)
		else
			RandomPoolCountUI:SetFontText("随机英雄池( "..leftcount.." )",0xffffff)
		end
	end
end

function CloseTalentUiAndChooseCurTalentIndex( index )
	SelTalentIndex = index-1
	if(bForbidNewTalent>0)then
		XSelSummonerTalent_gamestart( SelTalentIndex )
	end
	Font_showAll:SetFontText(BTN_TalentFont[index],0xfec479)
	BTN_LIST:SetButtonFrame(0)
	LIST_BK:SetVisible(0)
	for i,value in pairs(BTN_Talent) do
		BTN_Talent[i]:SetTransparent(0)
		BTN_Talent[i]:SetTouchEnabled(0)
	end
end


function ReturnToCharmChose(i)
	SelCharmIndex = i
	XSelSummonerCharm_gamestart(SelCharmIndex-1)
	CharmFont_showAll:SetFontText(BTN_CharmFont[SelCharmIndex],0xfec479)	
	log("\nSelCharmIndex = "..SelCharmIndex.."; BTN_CharmFont[SelCharmIndex] = "..BTN_CharmFont[SelCharmIndex])
	
	BTN_CHARMLIST:SetButtonFrame(0)
	CHARMLIST_BK:SetVisible(0)
	for index,value in pairs(BTN_Charm) do
		BTN_Charm[index]:SetTransparent(0)
		BTN_Charm[index]:SetTouchEnabled(0)
	end
end

-- 设置符文页Name
function ClearStart_CharmNameList()
	CurShowCharmIndex = 1
	BTN_CharmFont = {"符文页1","符文页2","符文页3","符文页4","符文页5","符文页6","符文页7","符文页8"}
	
	for i = 1, 8 do
		SummonerCharmList[i]:SetFontText(BTN_CharmFont[i], 0xfec479)
		BTN_Charm[i]:SetTransparent(0)
		BTN_Charm[i]:SetTouchEnabled(0)
	end
end
function SetStart_LastCharmName( i,name)
	SelCharmIndex = i+1	
	CharmFont_showAll:SetFontText(name,0xfec479)
end

function SetStart_CharmNameList( i,name)
	log("\ni = "..i.."; name = "..name.."; CurShowCharmIndex = "..CurShowCharmIndex)
	BTN_CharmFont[i] = name
	SummonerCharmList[i]:SetFontText(BTN_CharmFont[i], 0xfec479)
end












--新UI

-- 选择英雄信息表
function ClearChoseHeroInfo()	
	HeroList = {}					-- 清除发送来的信息
	HeroList.strPictureName = {}	-- 英雄头像路径
	HeroList.strName = {}			-- 英雄名称
	HeroList.heroId = {}
	HeroList.heroTip = {}
	HeroList.IsFavorite = {}
	
	DownMany = 0
	scissorwndBG:SetPosition(0,0)
	hero_togglebtn:SetPosition(-2,0)
	hero_togglebtn._T = 0
	
	for i,v in pairs(HERO_HEAD) do
		HERO_HEAD[i]:SetVisible(0)
		HERO_HIDE[i]:SetVisible(0)
	end		
end	

-- 获取开始选人的数据
function SendChoseHeroDataToLua(strPictureName,strName,heroId,tip,IsFavorite,iTaskWord)

	local size = #HeroList.strName+1
	
	HeroList.strPictureName[size] = "..\\"..strPictureName				
	HeroList.strName[size] = strName							
	HeroList.heroId[size] = heroId								
	HeroList.heroTip[size] = tip
	HeroList.IsFavorite[size] = IsFavorite	
	
	HERO_HEAD[size].changeimage(HeroList.strPictureName[size])
	HERO_HEAD[size]:SetImageTip(HeroList.heroTip[size])
	HERO_NAMEFONT[size]:SetFontText(HeroList.strName[size],0xffbcc9ff)
	HERO_HEAD[size]:SetVisible(1)
end
function SendChoseHeroDataOver()
	if #HeroList.strName <=42 then
		hero_toggleImg:SetVisible(0)
	else
		hero_toggleImg:SetVisible(1)
	end
end


-- 把自己拥有的被选择的英雄禁止点击
function ChoseHero_EnableHeroId(bChosedId,EnabledFlag)
	if XGetMapId()==BANPICK_WAITROOM then
		BanPickChoseHero_EnableHeroId(bChosedId,EnabledFlag)
	elseif XGetMapId()==RANK_WAITROOM then
		RankChoseHero_EnableHeroId(bChosedId,EnabledFlag)
	else
		--已被选择英雄ID	
		local size = #BeChosedHeroList.heroID+1	
		if EnabledFlag==0 then
			BeChosedHeroList.heroID[size] = bChosedId
		else
			for i,v in pairs(BeChosedHeroList.heroID) do
				if BeChosedHeroList.heroID[i] == bChosedId then
					BeChosedHeroList.heroID[i] = nil
				end
			end
		end
		
		--遮罩状态
		for i=1, MAXHERO do
			if HeroList.heroId[i] == bChosedId then
				HERO_HIDE[i]:SetVisible(1-EnabledFlag)
			end
		end
	end
end

function Chose_HeroClick()
	-- click_index = 0
	-- HERO_CLICK:SetVisible(0)
end

-- 快速登录则无法觉醒
function SetWakeUpButtonEnable(flag)	
	BTN_grow:SetEnabled(flag)
end


function AutoChoseHero_DeBug()
	
	-- click_index = 1
	-- local Lh,Th = HERO_SIDE[1]:GetPosition()
	-- HERO_CLICK:SetAbsolutePosition(Lh,Th)
	-- HERO_CLICK:SetVisible(1)	
	
	XGameHeroChoseId(HeroList.heroId[1])
end

-- 搜索英雄名称发送函数到C++
function StartChoseHero_OnSearchEnter()
	XSearchStartChoseHeroName(heronameInput:GetEdit(),index_showAll,index_oftenUse)
end








































--新UI
local TalentSummonerBK = nil

function InitGame_TalentFrame(wnd, bisopen)
	g_game_TalentFrame_ui = CreateWindow( wnd.id, 764,155,472,250)
	InitMainGame_TalentFrame( g_game_TalentFrame_ui)
	g_game_TalentFrame_ui:SetVisible( bisopen)
end
function InitMainGame_TalentFrame(wnd)		
	TalentSummonerBK = CreateWindow( wnd.id, 0,0,472,250)
	
	---------觉醒
	BTN_grow = TalentSummonerBK:AddButton( path_lolhero .. "FightWakeUpN.BMP", path_lolhero .. "FightWakeUpM.BMP", path_lolhero .. "FightWakeUpC.BMP", 367, 9, 78, 30)
	BTN_grow:AddFont("觉醒",18,8,0,0,78,30,0xbeb5ee)
	BTN_grow.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		if(WND_WAKEUP:IsVisible()==false) then
			WND_WAKEUP:SetPosition( 707, 198)
			SetGrowthUpArrowheadVisible(0)
			
			XSetHeroGrowthUpUiVisible(1, CueSelHeroId_gamestart)			
			WND_WAKEUP:SetVisible(1)
		else
			WND_WAKEUP:SetVisible(0)
		end
	end
		
	

	
	-----------------通用技能
	Common_BK = CreateWindow(TalentSummonerBK.id,28,116,70,18)
	
	Common_BK:AddImage(path_lolhero.."line.BMP",3000,29,438,1)
	Common_BK:AddImage(path_lolhero.."line2.BMP",3000,39,7,50)
	
	Common_ui = CreateWindow(TalentSummonerBK.id, 0,125,472,125)
	Common_ui:AddFont(" ",18,0,28,-9,100,20,0xceaf61)
	
	Common_pve = CreateWindow(TalentSummonerBK.id, 0,125,472,125)
	Common_pve:AddFont(" ",18,0,28,-9,100,20,0xceaf61)
	
	Common_pve:AddFont("物理攻击：",15,0,106,37,200,20,0xceaf61)
	Common_pve:AddFont("法术强度：",15,0,106,61,200,20,0xceaf61)
	Common_pve:AddFont("伤害加深：",15,0,284,47,200,20,0xceaf61)
	
	Phyattack = Common_pve:AddFont("10000",15,0,106+80,37,200,20,0x45b1c9)
	Magattack = Common_pve:AddFont("10087",15,0,106+80,61,200,20,0x45b1c9)
	Dmgadd = Common_pve:AddFont("150%",15,0,284+80,47,200,20,0x45b1c9)
	
	
	------辅助技能图片
	BTN_SKILL1 = Common_ui:AddImage(path_equip.."bag_equip.BMP",-740,440,48,48)
	BTN_SKILL2 = Common_ui:AddImage(path_equip.."bag_equip.BMP",-685,440,48,48)
	------两个辅助技能
	local SIDE1 = BTN_SKILL1:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)
	SIDE1:SetTouchEnabled(0)
	local SIDE2 = BTN_SKILL2:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)
	SIDE2:SetTouchEnabled(0)
	
	
	
	BTN_SKILL1.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)		
		XChangeAssistSkill(1)
		changeSummonerSkillIndex(1)
		n_summonerskill_ui:SetPosition(676,361)
	end
	BTN_SKILL2.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)	
		XChangeAssistSkill(2)
		changeSummonerSkillIndex(2)
		n_summonerskill_ui:SetPosition(742,361)
	end	
	
	Eye_ui = TalentSummonerBK:AddImage("..\\UI\\Head\\monster\\jiayan.dds",-630,565,48,48)
	local SIDE3 = Eye_ui:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)
	SIDE3:SetTouchEnabled(0)
	Eye_ui.script[XE_LBUP]= function()
		XClickPlaySound(UI_click_new)
	
		SetEyeSelectIsVisible(1)
		--n_eyeSelect_ui:SetPosition(842,361)
	end
	
	
	BloodSkinChoosebtn = TalentSummonerBK:AddImage("..\\UI\\Common\\Blood\\bloodskin.BMP",-580,565,48,48)
	local SIDEBlood = BloodSkinChoosebtn:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)
	SIDEBlood:SetTouchEnabled(0)
	initBloodskinChooseFrame(wnd)
	BloodSkinChoosebtn.script[XE_LBUP] = function()
		if BloodSkinChooseFrame:IsVisible() then
			BloodSkinChooseFrame:SetVisible(0)
		else
			XBloodSkinChooseFrameStart()
			BloodSkinChooseFrame:SetVisible(1)
		end
	end
	
	
	-- 天赋专精
	Talent_BK = CreateWindow(TalentSummonerBK.id,28,16,70,18)	
	Talent_BK:AddImage(path_lolhero.."line.BMP",3000,29,438,1)
	
	Talent_ui = CreateWindow(TalentSummonerBK.id, 0,0,472,125)
	Talent_ui:AddFont(" ",18,0,28,16,100,20,0xffbcc9ff)
	
	Talent_pve = CreateWindow(TalentSummonerBK.id, 0,0,472,125)
	Talent_pve:AddFont("当前关卡",18,0,28,16,100,20,0xceaf61)

	Charm_ui = CreateWindow(TalentSummonerBK.id, 236,0,472,125)
	Charm_ui:AddFont(" ",18,0,28,16,100,20,0xffbcc9ff)

	-----------PVE选层数---开始
	pve_BTN_LIST = Talent_pve:AddTwoButton(path_lolhero.."talentlist1_start.BMP", path_lolhero.."talentlist2_start.BMP", path_lolhero.."talentlist1_start.BMP",143,62,194,32)
	pve_Font_showAll = pve_BTN_LIST:AddFont(pve_BTN_TalentFont[1],15,0,20,5,200,15,0xfec479)
	
	pve_LIST_BK = Talent_pve:AddImage(path_lolhero.."talentlistBK_start.BMP",147,96,186,290)
	pve_LIST_BK:SetImageFrameWidth(10)
	pve_LIST_BK:SetVisible(0)
	
	for dis = 1,10 do
		pve_BTN_Talent[dis] = pve_LIST_BK:AddImage(path_lolhero.."talentlisthover_start.BMP",1,dis*29-28,184,28)
		pve_SummonerTalentList[dis] = pve_LIST_BK:AddFont(pve_BTN_TalentFont[dis],15,0,40,dis*29-23,184,28,0xfec479)
		pve_BTN_Talent[dis]:SetTransparent(0)
		pve_BTN_Talent[dis]:SetTouchEnabled(0)
		-- 鼠标滑过
		pve_BTN_Talent[dis].script[XE_ONHOVER] = function()
			if pve_LIST_BK:IsVisible() == true then
				pve_BTN_Talent[dis]:SetTransparent(1)
			end
		end
		pve_BTN_Talent[dis].script[XE_ONUNHOVER] = function()
			if pve_LIST_BK:IsVisible() == true then
				pve_BTN_Talent[dis]:SetTransparent(0)
			end
		end
		
		pve_BTN_Talent[dis].script[XE_LBUP] = function()
			
			pve_Font_showAll:SetFontText(pve_BTN_TalentFont[dis],0xfec479)
			pve_BTN_LIST:SetButtonFrame(0)
			pve_LIST_BK:SetVisible(0)
			for index,value in pairs(pve_BTN_Talent) do
				pve_BTN_Talent[index]:SetTransparent(0)
				pve_BTN_Talent[index]:SetTouchEnabled(0)
			end
			XChooseLevel(pve_BTN_TalentFont[dis])
		end
	end
	
	pve_BTN_LIST.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if pve_LIST_BK:IsVisible() then
			pve_LIST_BK:SetVisible(0)
			for index,value in pairs(pve_BTN_Talent) do
				pve_BTN_Talent[index]:SetTransparent(0)
				pve_BTN_Talent[index]:SetTouchEnabled(0)
			end
		else
			pve_LIST_BK:SetVisible(1)
			for index,value in pairs(pve_BTN_Talent) do
				pve_BTN_Talent[index]:SetTransparent(0)
				pve_BTN_Talent[index]:SetTouchEnabled(1)
			end
		end
	end
	
	-----------PVE选层数---结束
	
	BTN_change = Talent_ui:AddButton(path_lolhero.."changeBtn1_start.BMP",path_lolhero.."changeBtn2_start.BMP",path_lolhero.."changeBtn1_start.BMP",-732,0,30,30)
	BTN_change.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		local mapid = XGetMapId()
		
		-- 地图号低于100的不是在场内
		if mapid <100 then
			if(bForbidNewTalent>0)then
				XSelSummonerTalent_gamestart( SelTalentIndex )
			else
				XSelNewTalent_gamestart( SelTalentIndex )
			end
		
			SetTalent_InsideIsVisible(1)
		end
	end
	
	-- 显示全部下拉背景框
	BTN_LIST = Talent_ui:AddTwoButton(path_lolhero.."talentlist1_start.BMP", path_lolhero.."talentlist2_start.BMP", path_lolhero.."talentlist1_start.BMP",-697,0,194,32)
	Font_showAll = BTN_LIST:AddFont("天赋页1",15,0,20,5,200,15,0xfec479)
	
	LIST_BK = Talent_ui:AddImage(path_lolhero.."talentlistBK_start.BMP",-690,35,186,290)
	LIST_BK:SetImageFrameWidth(10)
	LIST_BK:SetVisible(0)
	
	for dis = 1,10 do
		BTN_Talent[dis] = LIST_BK:AddImage(path_lolhero.."talentlisthover_start.BMP",1,dis*29-28,184,28)
		SummonerTalentList[dis] = LIST_BK:AddFont(BTN_TalentFont[dis],15,0,40,dis*29-23,184,28,0xfec479)
		BTN_Talent[dis]:SetTransparent(0)
		BTN_Talent[dis]:SetTouchEnabled(0)
		-- 鼠标滑过
		BTN_Talent[dis].script[XE_ONHOVER] = function()
			if LIST_BK:IsVisible() == true then
				BTN_Talent[dis]:SetTransparent(1)
			end
		end
		BTN_Talent[dis].script[XE_ONUNHOVER] = function()
			if LIST_BK:IsVisible() == true then
				BTN_Talent[dis]:SetTransparent(0)
			end
		end
		
		BTN_Talent[dis].script[XE_LBUP] = function()
			SelTalentIndex = dis-1
			XChangeNewTalentPage(dis)
			
			if(bForbidNewTalent>0)then
				XSelSummonerTalent_gamestart( SelTalentIndex )
			else
				XSelNewTalent_gamestart( SelTalentIndex )
			end
			Font_showAll:SetFontText(BTN_TalentFont[dis],0xfec479)
			BTN_LIST:SetButtonFrame(0)
			LIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Talent) do
				BTN_Talent[index]:SetTransparent(0)
				BTN_Talent[index]:SetTouchEnabled(0)
			end
		end
	end
	
	BTN_LIST.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if LIST_BK:IsVisible() then
			LIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Talent) do
				BTN_Talent[index]:SetTransparent(0)
				BTN_Talent[index]:SetTouchEnabled(0)
			end
		else
			LIST_BK:SetVisible(1)
			for index,value in pairs(BTN_Talent) do
				BTN_Talent[index]:SetTransparent(0)
				BTN_Talent[index]:SetTouchEnabled(1)
			end
		end
	end
	
	
	------------符文	
	BTN_CHARM = Charm_ui:AddButton(path_lolhero.."changeBtn1_start.BMP",path_lolhero.."changeBtn2_start.BMP",path_lolhero.."changeBtn1_start.BMP",-770,-38,30,30)
	BTN_CHARM.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		local mapid = XGetMapId()
		
		if mapid<50 and mapid>1 then -- 代表选人界面
			SetCharm_InsideIsVisible(1)
						
			SelCharmIndex  =  math.max(1,SelCharmIndex)
			JumpToCharmPage(SelCharmIndex)

			BTN_CHARMLIST:SetButtonFrame(0)
			CHARMLIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Charm) do
				BTN_Charm[index]:SetTransparent(0)
				BTN_Charm[index]:SetTouchEnabled(0)
			end
		end
	end
	-- 显示全部下拉背景框
	BTN_CHARMLIST = Charm_ui:AddTwoButton(path_lolhero.."talentlist1_start.BMP", path_lolhero.."talentlist2_start.BMP", path_lolhero.."talentlist1_start.BMP",283,-40,194,32)
	CharmFont_showAll = BTN_CHARMLIST:AddFont("符文页1",15,0,20,5,200,15,0xfec479)
	
	CHARMLIST_BK = Charm_ui:AddImage(path_lolhero.."talentlistBK_start.BMP",285,0,186,290)
	CHARMLIST_BK:SetImageFrameWidth(10)
	CHARMLIST_BK:SetVisible(0)
	CHARMLIST_BK:EnableEvent(XE_MOUSEWHEEL)
	CHARMLIST_BK.script[XE_MOUSEWHEEL] = function()
		local updown  = XGetMsgParam0()
		if updown>0 then
			-- 上
			if CurShowCharmIndex<=1 then
				CurShowCharmIndex = 1
			else
				CurShowCharmIndex = CurShowCharmIndex-1
			end
		elseif updown<0 then
			-- 下
			if CurShowCharmIndex >= #BTN_CharmFont then
				CurShowCharmIndex = #BTN_CharmFont
			else
				CurShowCharmIndex = CurShowCharmIndex+1
			end
		end
		
		for i = 1, 8 do
			BTN_Charm[i]:SetTransparent(0)
			SummonerCharmList[i]:SetFontText(BTN_CharmFont[i + CurShowCharmIndex - 1], 0xfec479)
		end
	end
	
	for dis = 1,8 do
		BTN_Charm[dis] = CHARMLIST_BK:AddImage(path_lolhero.."talentlisthover_start.BMP",1,dis*29-28,184,28)
		SummonerCharmList[dis] = CHARMLIST_BK:AddFont(BTN_CharmFont[dis],15,0,40,dis*29-23,184,28,0xfec479)
		BTN_Charm[dis]:SetTransparent(0)
		BTN_Charm[dis]:SetTouchEnabled(0)
		-- 鼠标滑过
		BTN_Charm[dis].script[XE_ONHOVER] = function()
			if CHARMLIST_BK:IsVisible() == true then
				if (dis+CurShowCharmIndex-1) <= #BTN_CharmFont then
					if BTN_CharmFont[dis+CurShowCharmIndex-1] ~= "" then
						BTN_Charm[dis]:SetTransparent(1)
					end
				end
			end
		end
		BTN_Charm[dis].script[XE_ONUNHOVER] = function()
			if CHARMLIST_BK:IsVisible() == true then
				if (dis+CurShowCharmIndex-1) <= #BTN_CharmFont then
					if BTN_CharmFont[dis+CurShowCharmIndex-1] ~= "" then
						BTN_Charm[dis]:SetTransparent(0)
					end
				end
			end
		end
		
		BTN_Charm[dis].script[XE_LBUP] = function()			
			if (dis+CurShowCharmIndex-1) <= #BTN_CharmFont then
				if BTN_CharmFont[dis+CurShowCharmIndex-1] ~= "" then
					SelCharmIndex = dis+CurShowCharmIndex-1
					-- log("\nSelCharmIndex = "..SelCharmIndex.."; CurShowCharmIndex = "..CurShowCharmIndex)
					
					XSelSummonerCharm_gamestart(SelCharmIndex-1)
					CharmFont_showAll:SetFontText(BTN_CharmFont[dis+CurShowCharmIndex-1],0xfec479)
		
					BTN_CHARMLIST:SetButtonFrame(0)
					CHARMLIST_BK:SetVisible(0)
					for index,value in pairs(BTN_Charm) do
						BTN_Charm[index]:SetTransparent(0)
						BTN_Charm[index]:SetTouchEnabled(0)
					end
				end
			end
		end
	end
	
	BTN_CHARMLIST.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if CHARMLIST_BK:IsVisible() then
			CHARMLIST_BK:SetVisible(0)
			for index,value in pairs(BTN_Charm) do
				BTN_Charm[index]:SetTransparent(0)
				BTN_Charm[index]:SetTouchEnabled(0)
			end
		else
			CHARMLIST_BK:SetVisible(1)
			for index,value in pairs(BTN_Charm) do
				BTN_Charm[index]:SetTransparent(0)
				BTN_Charm[index]:SetTouchEnabled(1)
			end
		end
	end
	
end

function SetGameStart_WakeUpIsVisible(flag)
	if BTN_grow ~= nil then
		BTN_grow:SetVisible(flag)
	end
end

----------------------------------------------------------------------------------------------------------------
function initBloodskinChooseFrame(wnd)--下拉窗口
	BloodSkinChooseFrame = wnd:AddImage(path_lolplayerinfo .. "bloodlistbg.BMP",-743,273,473,333)
	BloodSkinChooseFrame:SetVisible(0)
	BloodSkinChooseFrame:EnableBlackBackgroundTop(1)
	BloodSkinChooseFrame:AddFont("血条皮肤", 18, 0, 210, 15, 100, 40, 0x9a9ab2)
	for index = 1,3 do
		BloodSkinBack[index] = BloodSkinChooseFrame:AddImage(path_lolplayerinfo.."talbloodlist.BMP",38,62+(index-1)*72,400,68)
		BloodSkinBack[index]:SetTouchEnabled(1)
		BloodSkinName[index] = BloodSkinBack[index]:AddFont("血条",15,0,12,21,85,15,0xffe0bf67)
		BloodSkinName[index]:SetTouchEnabled(0)
		BloodSkinpic[index] = BloodSkinBack[index]:AddImage("../UI/Common/Blood/moren.png", 90,2, 219, 66)
		BloodSkinpic[index]:SetTouchEnabled(0)
		BloodSkinBack[index].script[XE_LBUP] = function()
			XChooseBloodSkin(BloodSkinInfo.id[index + updownCountBlood])
			
			for ip = 1,3 do
				BloodSkinBack[ip].changeimage(path_lolplayerinfo.."talbloodlist.BMP")
			end
			BloodSkinBack[index].changeimage(path_lolplayerinfo.."talbloodlist2.BMP")
			BloodSkinChooseFrame:SetVisible(0)
		
		end
	end
	
	local btn_close = BloodSkinChooseFrame:AddButton(path_lolcommon.."close1.BMP",path_lolcommon.."close2.BMP",path_lolcommon.."close3.BMP",452,10,35,35)
	btn_close.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
	    BloodSkinChooseFrame:SetVisible(0)
	end
	
	
	BloodSkinChooseFrame:EnableEvent(XE_MOUSEWHEEL)
	BloodSkinChooseFrame.script[XE_MOUSEWHEEL] = function()
		local updown  = XGetMsgParam0()
		local maxUpdownBlood = math.ceil(#BloodSkinInfo.name -3)
		local length = 0

		if #BloodSkinInfo.name >3 then
			maxUpdownBlood = math.ceil(#BloodSkinInfo.name-3)
			length = 204/maxUpdownBlood
		else
			maxUpdownBlood = 0
			length = 204
		end
		if updown>0 then
			updownCountBlood = updownCountBlood-1
			if updownCountBlood<0 then
				updownCountBlood=0
			end
		else
			updownCountBlood = updownCountBlood+1
			if updownCountBlood>maxUpdownBlood then
				updownCountBlood=maxUpdownBlood
			end
		end	
		local btn_pos = length*updownCountBlood
	
		
		if updownCountBlood >= 0 and updownCountBlood <= maxUpdownBlood then
			BloodSkinChooseDraw()
		end
	end
	
end

function BloodSkinChooseDraw()
	local num = #BloodSkinInfo
	for inp = 1,3 do
		BloodSkinBack[inp]:SetVisible(0)
	end
	log("BloodSkinChooseDrawStart")
	local index = 1;
	for i = 1, #BloodSkinInfo.name do
		log("updownCountBlood"..updownCountBlood)
		if i<=updownCountBlood + 3 and i>updownCountBlood then
		log("updownCountBlood_step_1  i ".. i)
			log("updownCountBlood_step_1  "..BloodSkinInfo.name[i])
			BloodSkinName[index]:SetFontText(BloodSkinInfo.name[i],0xffe0bf67)
			log("updownCountBlood_step_2")
			BloodSkinBack[index]:SetVisible(1)
			log("updownCountBlood_step_3")
			BloodSkinpic[index].changeimage("..\\"..BloodSkinInfo.path[i])
			log("updownCountBlood_step_4")
			
			--or ((BloodSkinChooseId == 0 or BloodSkinChooseId == -1) and BloodSkinInfo.id[i] == 53700)
			
			log("BloodSkinChooseId "..BloodSkinChooseId.."   ".."BloodSkinInfo.id[i]"..BloodSkinInfo.id[i])
			if BloodSkinChooseId == BloodSkinInfo.id[i]  then
				BloodSkinBack[index].changeimage(path_lolplayerinfo.."talbloodlist2.BMP")
			elseif (BloodSkinChooseId == 0 or BloodSkinChooseId == -1) and BloodSkinInfo.id[i] == 53700 then
				BloodSkinBack[index].changeimage(path_lolplayerinfo.."talbloodlist2.BMP")
			else
				BloodSkinBack[index].changeimage(path_lolplayerinfo.."talbloodlist.BMP")
			end
			index = index+1
		end
		log("updownCountBlood"..updownCountBlood)
	end
end

function clearBloodSkinInfo()
	BloodSkinInfo.name = {}
	BloodSkinInfo.path = {}
	BloodSkinInfo.id = {}
end

function SetBloodSkinChoosid(chooseid)
	BloodSkinChooseId = chooseid
end

function SetBloodSkinChooseInfo(index , name , path ,id)
	BloodSkinInfo.name[index] = name
	BloodSkinInfo.path[index] = path
	BloodSkinInfo.id[index] = id
	
	log("index  "..index.."   name   "..BloodSkinInfo.name[index].."  path  "..BloodSkinInfo.path[index].."  id  "..id )
end

function SetBloodSkinChoosebtnVisible(bo)
	BloodSkinChoosebtn:SetVisible(bo)
end

----------------------------------------------------------------------------------------------------------------


--设置显示
function SetGameTalentFrameIsVisible(flag) 
	if g_game_TalentFrame_ui ~= nil then
		if flag == 1 and g_game_TalentFrame_ui:IsVisible() == false then
			g_game_TalentFrame_ui:CreateResource()
			g_game_TalentFrame_ui:SetVisible(1)
			
			--XInGameLog("act=WINDOW,Function=SetGameTalentFrameIsVisible,visible=true")
		elseif flag == 0 and g_game_TalentFrame_ui:IsVisible() == true then
			g_game_TalentFrame_ui:DeleteResource()
			g_game_TalentFrame_ui:SetVisible(0)			
			BloodSkinChooseFrame:SetVisible(0)
			
			--XInGameLog("act=WINDOW,Function=SetGameTalentFrameIsVisible,visible=false")
		end
	end
end

function GetGameTalentFrameIsVisible()
	if ( g_game_TalentFrame_ui ~= nil and g_game_TalentFrame_ui:IsVisible() ) then
		return 1
	else
		return 0
	end
end