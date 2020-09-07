include("../Data/Script/Common/include.lua")
include("../Data/Script/Common/rotateGameHall.lua")

-- local IsTodayFirstSignIn = 0      -----是否今日首次登陆

OffsetY1 = 0
OffsetY2_Start = 0
OffsetY3_talent = 0
OffsetY4_onlinetime = 0
OffsetY5_fightmode = 0
OffsetY6_shop = 0
Y_equip = 0


function SetWindowOffset(y1)
	OffsetY1 = y1
	OffsetY2_Start = y1-25
	OffsetY3_talent = y1-50
	OffsetY4_onlinetime = y1-40
	OffsetY5_fightmode = y1
	OffsetY6_shop = y1-43
	Y_equip = y1-43

end

function InitGame_hallUI(wnd, bisopen)
	g_game_hall_ui = CreateWindow(wnd.id, 0, 0, 1280, 800)
	InitMainGame_hall(g_game_hall_ui)
	g_game_hall_ui:SetVisible(bisopen)	
end

-- 大厅背景图和英雄Id
local MainHall_BK = nil
local MainHall_Effect = nil
MainHall_BKHeroId = 274
MainHall_BKSkinId = SKIN_ID_MAX
local path_MailHallHero = "../UI/hero/" .. MainHall_BKHeroId .. ".BMP"
local path_MailHallSkin = "../UI/Icon/Skin/" .. MainHall_BKHeroId .. "/" .. MainHall_BKHeroId .. "Skin" .. MainHall_BKSkinId .."_.BMP"

local btn_gotoshop = nil
local btn_herodetail = nil
local btn_defaultbk = nil

local btn_switchsuper = nil
local btn_live2d = nil
local Panel_Super = nil
local font_l2d = nil
local wnd_live2d = nil
local effect_live2d = nil

local dlg_live2d = {}
dlg_live2d.BK = nil

local Currunt_HeroId = 0
local Currunt_SkinId = 0
local Currunt_Super = 0
--local path_Live2d = path.."live2d/"
local Panel_BK = nil
local Panel_BK_F = nil
local Panel_BK_B = nil
local Live2D_Pop = nil
local Live2D_PopFont = nil
--local btn_live2d_in = nil
local Live2D_Bubble = nil


local QRCode = nil
local LearnSkillBtnEffectShine = nil


local wid = 0---250
local hei = 0--150
local live2dWindow = nil

local Panel_rotate = nil

-- 模型展示
local ModelWnd = nil
local bShowModel = false
local btnSwitch = nil

local function ShowModelWnd(show)
	bShowModel = ModelWnd:ShowWnd(show,Currunt_HeroId,Currunt_SkinId)
end

local function CheckModelWnd()
	if XHeroDetailShowModdel(Currunt_HeroId,Currunt_SkinId,"GameHallChangeModelWnd") then
		ShowModelWnd(1)
		btnSwitch:SetVisible(1)
	else
		ShowModelWnd(0)
		btnSwitch:SetVisible(0)
	end
end

function GameHallChangeModelWnd(x,y,z,Rx,Ry,Rz,strmodel,sound1,sound2)
	ModelWnd:ChangeModel(x,y,z,Rx,Ry,Rz,strmodel,sound1,sound2)
end
-------------------------------------------

local nImageIndex = 0

local test = nil
local function SetChangeImageVisible()
	local IsBtnChangeImageVisible = XIsHaveMoreImage(Currunt_HeroId,Currunt_SkinId)
	SetChangeImageBtnVisible(IsBtnChangeImageVisible)
end


--   CEF
local CloseCEF = nil
function InitCef2CloseButton(wnd, bisopen)
    CloseCEF = wnd:AddButton(path_shop.."close1_rec.BMP",path_shop.."close2_rec.BMP",path_shop.."close3_rec.BMP",500,180,35,35)
	CloseCEF.script[XE_LBUP] = function()
		XCloseCefButton()
	end
	CloseCEF:EnableBlackBackgroundTop(1)
	CloseCEF:SetVisible(0)
end

function SetCEF_Visible(ibool,x,y)
    if ibool == 1 then
	    CloseCEF:SetVisible(1)
		CloseCEF:SetPosition(x,y)
	else
	    CloseCEF:SetVisible(0)
	end
end	
function InitMainGame_hall(wnd)

	--底图背景
	MainHall_BK = wnd:AddImage(path_MailHallSkin,0,0,1280,800)
	MainHall_Effect = wnd:AddEffect(Dynamic_BG,0,0,1280,800)
	--MainHall_Effect:SetTouchEnabled(0)
	
	MainHall_BK.script[XE_LBUP] = function()
		XClickHallPic()
	end
	
	MainHall_Effect.script[XE_LBUP] = function()
		XClickHallPic()
	end
	
	Panel_rotate = RotateHallPanel:New(wnd.id)
	Panel_rotate:SetVisible(0)
	
	--恢复默认
	btn_defaultbk = wnd:AddButton(path.."button1_hall.BMP", path.."button2_hall.BMP", path.."button3_hall.BMP",20000,700, 179, 56)
	btn_defaultbk:AddFont("默认背景", 15, 8, 0, 0, 179, 56, 0xbeb9cf)
	btn_defaultbk.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if MainHall_BKSkinId==SKIN_ID_MAX then
			SetImage_MainHallBK(path_MailHallHero, "")
		else
			SetImage_MainHallBK(path_MailHallSkin, "")
		end
		
		XSendMainBKData(MainHall_BKHeroId, MainHall_BKSkinId)
		Currunt_HeroId = MainHall_BKHeroId
		Currunt_SkinId = MainHall_BKSkinId
		nImageIndex = 0
		
		if XIsHaveSuperSkin(Currunt_HeroId, Currunt_SkinId) then
			ShowLive2dDlg(0)
		else
			ShowLive2dDlg(1)
		end
		
		if XShowLive2D(wnd_live2d.id, 1) then
			btn_switchsuper:SetVisible(1)
			btn_live2d:SetVisible(1)

			btn_gotoshop:SetVisible(0)
			btn_herodetail:SetVisible(0)
			HeroDetail_SetVisible(0)
			
		else
			btn_switchsuper:SetVisible(0)
			btn_live2d:SetVisible(0)
			
			btn_gotoshop:SetVisible(1)
			btn_herodetail:SetVisible(1)
			HeroDetail_SetVisible(1)
			
			Live2D_Bubble:SetVisible(0)
			Live2D_Pop:SetVisible(0)
		end

		CheckModelWnd()
		
		btn_defaultbk:SetVisible(0)
		DefaultBK_SetVisible(0)
		
		Panel_BK:SetVisible(0)
		Panel_BK_F:SetVisible(0)
		Panel_BK_B:SetVisible(0)
			
		if Panel_Super ~= nil then
			Panel_Super:Close()
			Panel_Super = nil
			Panel_BK:SetVisible(0)
			Panel_BK_F:SetVisible(0)
			Panel_BK_B:SetVisible(0)
		end
		
		SetChangeImageVisible()
	end
	btn_defaultbk:SetVisible(0)
	
	--前往商城
	btn_gotoshop = wnd:AddButton(path.."button1_hall.BMP", path.."button2_hall.BMP", path.."button3_hall.BMP",20000,700, 179, 56)
	btn_gotoshop:AddFont("前往商城", 15, 8, 0, 0, 179, 56, 0xbeb9cf)
	btn_gotoshop.script[XE_LBUP] = function()
		XClickPlaySound(Sound_shop)
		
		XShopUiIsClick(1)
		-----跳到商城英雄界面+
		Set_JumpToShopHero()
	end
	--英雄详情
	btn_herodetail = wnd:AddButton(path.."button1_hall.BMP", path.."button2_hall.BMP", path.."button3_hall.BMP",20000,700, 179, 56)
	btn_herodetail:AddFont("英雄详情", 15, 8, 0, 0, 179, 56, 0xbeb9cf)
	btn_herodetail.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
				
		------跳到集卡书二级页面
		Set_JumpToHeroDetail()
		--Set_JumpToEquipSynthesize()
	end
	
	live2dWindow = CreateWindow(MainHall_BK.id, wid, hei, 1280,800)
	wnd_live2d = live2dWindow:AddLive2DWnd(wid, hei, 1280, 800)

	--台词气泡
	Live2D_Pop = live2dWindow:AddImage(path_lollive2d.."paopao.bmp",566-wid,122-hei,255,140)
	Live2D_PopFont = Live2D_Pop:AddFont("",18,8,0,0,255,140,0xf69752)
	Live2D_Pop:SetVisible(0)
	
	--点击气泡
	Live2D_Bubble = live2dWindow:AddImage(path_lollive2d.."pp.bmp",566-wid,250-hei,97,71)
	Live2D_Bubble.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		XClickLive2D(wnd_live2d.id)
	end
	Live2D_Bubble:SetVisible(0)
	wnd_live2d:SetVisible(0)
	
	effect_live2d = MainHall_BK:AddEffect("",0,0,1280,800)
	effect_live2d:SetTouchEnabled(0)
	effect_live2d:SetVisible(0)
	
	-- 底
	Panel_BK_F = MainHall_BK:AddImage(path_lollive2d.."bgf.bmp",167,690,40,58);
	Panel_BK_B = MainHall_BK:AddImage(path_lollive2d.."bgb.bmp",167,690,40,58);
	Panel_BK = MainHall_BK:AddImage(path_lollive2d.."bg.bmp",207,690,40,58)
	Panel_BK:SetVisible(0)
	Panel_BK_F:SetVisible(0)
	Panel_BK_B:SetVisible(0)
	
	--Live2D
	btn_live2d = MainHall_BK:AddButton(path_lollive2d.."otaku_1.BMP", path_lollive2d.."otaku_2.BMP", path_lollive2d.."otaku_3.BMP",50,677, 85, 80)
	btn_live2d.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
	
		if wnd_live2d:IsVisible() then
			XShowLive2D(wnd_live2d.id, 0)
			Live2D_Bubble:SetVisible(0)
			Live2D_Pop:SetVisible(0)
		else
			XShowLive2D(wnd_live2d.id, 1)
			Live2D_Bubble:SetVisible(1)
		end
	end
	
	--职介切换
	btn_switchsuper = MainHall_BK:AddButton(path_lollive2d.."maho.BMP", path_lollive2d.."maho_l.BMP", path_lollive2d.."maho.BMP",135,690, 109, 67)
	btn_switchsuper.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		if Panel_Super ~= nil then
			Panel_Super:Close()
			Panel_Super = nil
			Panel_BK:SetVisible(0)
			Panel_BK_F:SetVisible(0)
			Panel_BK_B:SetVisible(0)
		else
			Panel_Super = SuperSkinPanel:New(btn_switchsuper.id, 32, 1, 303, 60)
			InitSuperSkin(Currunt_HeroId, Currunt_SkinId, "GameHall_AddSuperSkin")
			Panel_Super:DoShow()
			
			local n = #Panel_Super.Skins.Image
			n = n * 69
			local cx = n - 10
			
			Panel_BK:SetWH(cx,58)
			Panel_BK:SetVisible(1)
			
			Panel_BK_F:SetVisible(1)
			Panel_BK_B:SetVisible(1)
			Panel_BK_B:SetPosition(cx+207,690)
		end
	end
	
	-- --Live2D内
	-- btn_live2d_in = wnd_live2d:AddButton(path_lollive2d.."otaku_3.BMP", path_lollive2d.."otaku_4.BMP", path_lollive2d.."otaku_5.BMP",50-wid,677-hei, 85, 80)
	-- btn_live2d_in.script[XE_LBUP] = function()
		-- XClickPlaySound(UI_click_new)

		-- XShowLive2D(wnd_live2d.id, 0)
	-- end
	
	btn_switchsuper:SetVisible(0)
	btn_live2d:SetVisible(0)
	ShowLive2dDlg(1)
	XShowLive2D(wnd_live2d.id, 1)

	ModelWnd = ModelWindow:Init(MainHall_BK,0,0,1280,800,"")
	ShowModelWnd(0)

	btnSwitch = MainHall_BK:AddButton(path_lolcard.."switch1.BMP",path_lolcard.."switch2.BMP",path_lolcard.."switch3.BMP",605,694, 70,70)
	btnSwitch.script[XE_LBUP] = function()
		if bShowModel then
			ShowModelWnd(0)
		else
			ShowModelWnd(1)
		end
	end
	btnSwitch:SetVisible(0)
	
end

function ChangeHeroCG()
	XChangeOriginalImage(Currunt_HeroId,Currunt_SkinId,nImageIndex,1)
end




function SetBingo_TimeRange(starttime,endtime)	
	SetBingo_ActivityTimeRange(starttime.."-"..endtime)
end


-- 设置大厅背景图
function SetImage_MainHallBK(picture,path)
log("\npicture = "..picture)
	MainHall_BK.changeimage(picture)
	if path ~= "" then
		MainHall_Effect:ChangeEffect(path)
		MainHall_Effect:SetTouchEnabled(1)
	else
		MainHall_Effect:ChangeEffect(Dynamic_BG)
		MainHall_Effect:SetTouchEnabled(0)
	end
end

-- 恢复默认时按钮处理
function ShowDefaultMainHallBK(default,shop,herodetail,havechangeimage)	
log("\ndefault = "..default..";shop = "..shop..";herodetail = "..herodetail)
	DefaultBK_SetVisible(default)
	btn_defaultbk:SetVisible(default)
	
	btn_gotoshop:SetVisible(shop)
	btn_herodetail:SetVisible(herodetail)
	HeroDetail_SetVisible(herodetail)
	
	SetChangeImageBtnVisible(havechangeimage)
end


function JumpTo_OnlineActivity()
	SetMonopolyIsVisible(0)
	ActivityList_Click(2,"")
	JumpTo_OnlineActivityDuiHuan()
end

function Reset_DefaultBK()
	btn_defaultbk:TriggerBehaviour(XE_LBUP)
end




--设置显示
function SetGameHallIsVisible(flag) 
	if g_game_hall_ui ~= nil then
		if flag == 1 and g_game_hall_ui:IsVisible() == false then
			--g_game_hall_ui:CreateResource()
			g_game_hall_ui:SetVisible(1)
			SetReturnVisible(0)
			SetFourpartUIVisiable(1)
			--SetChatMainIsVisible(1)
			SetCurTitleState_teadytime(1)
			SetPassKeyNull_Login()			
			
			XInGameLog("act=WINDOW,Function=SetGameHallIsVisible,visible=true")
		elseif flag == 0 and g_game_hall_ui:IsVisible() == true then
			--g_game_hall_ui:DeleteResource()
			g_game_hall_ui:SetVisible(0)
			SetReturnVisible(1)
			--SetChatMainIsVisible(0)
			SetExpression_interfaceVisible(0)--由于表情层级比较高
			
			--XInGameLog("act=WINDOW,Function=SetGameHallIsVisible,visible=false")
		end
	end
end
--获取是否显示
function GetGameHallIsVisible()  
    if g_game_hall_ui~=nil and g_game_hall_ui:IsVisible()==true then
        return 1
    else
        return 0
    end
end

function SendIsSuperToHall(heroid, skinid, issuper)
	if Panel_Super ~= nil then
		Panel_Super:Close()
		Panel_Super = nil
		Panel_BK:SetVisible(0)
		Panel_BK_F:SetVisible(0)
		Panel_BK_B:SetVisible(0)
	end
	
	if issuper ~= nil and issuper == 1 then
		if heroid == 168 then
			btn_switchsuper:SetVisible(1)
			btn_live2d:SetVisible(1)
			--btn_live2d_in:SetVisible(1)
			XShowLive2D(wnd_live2d.id, 0)
			Live2D_Bubble:SetVisible(0)
			Live2D_Pop:SetVisible(0)
		else
			btn_switchsuper:SetVisible(0)
			btn_live2d:SetVisible(0)
			XShowLive2D(wnd_live2d.id, 1)
			--btn_live2d_in:SetVisible(0)
		end

		btn_gotoshop:SetVisible(0)
		btn_herodetail:SetVisible(0)
		HeroDetail_SetVisible(0)
	else
		btn_switchsuper:SetVisible(0)
		btn_live2d:SetVisible(0)
		wnd_live2d:SetVisible(0)
		Live2D_Bubble:SetVisible(0)
		Live2D_Pop:SetVisible(0)
	end
	
	Currunt_HeroId = heroid
	Currunt_SkinId = skinid
	Currunt_Super = issuper
	
	nImageIndex = 0
	SetChangeImageVisible()
	
	RefreshLive2dDlg()

	CheckModelWnd()
end

function GameHall_AddSuperSkin(path,Have,heroid,skinid,x,y,w,h)
	if Panel_Super ~= nil then
		local headpic = path_lollive2d..heroid.."_"..skinid.."_";
		Panel_Super:AddSkin(path, enable, headpic, x, y, w, h, 110, 170)
		
		local count = #Panel_Super.Skins.Image
		Panel_Super.Skins.Image[count].script[XE_LBUP] = function()
			SetImage_MainHallBK(path,"")
			XSaveSuperSkinIndex(count-1)
			btn_live2d:SetEnabled(Have)
			
			if wnd_live2d:IsVisible() then
				XShowLive2D(wnd_live2d.id, 1)
			end
			
			-- if wnd_live2d:IsVisible() then
				-- ShowLive2dDlg(1)
			-- else
				-- ShowLive2dDlg(0)
			-- end
		end
		
		if count == 1 then
			Have=1
		end
		
		--Panel_Super:SetLock(count,Have)
	end
end

function ShowLive2dDlg(show)
	if dlg_live2d.BK == nil then
		-- dlg_live2d.Show = g_game_hall_ui:AddButton(path.."live2d/dakaiduihua.BMP", path.."live2d/dakaiduihua.BMP", path.."live2d/dakaiduihua.BMP",572,730, 88, 31)
		-- dlg_live2d.Show.script[XE_LBUP] = function()
			-- if dlg_live2d.BK~= nil then
				-- dlg_live2d.BK:MoveBy(0,-245,0.5)
			-- end
		-- end
		
		dlg_live2d.BK = wnd_live2d:AddImage(path.."live2d/duihuakuang.BMP",51-wid,463-hei,250,173)
		--dlg_live2d.BK:AddFont("Master你好，我是看板\n娘——伊利亚，如果需\n要伊利亚长期陪伴，请\n前往         购买圣杯战争\n皮肤礼包召唤我哦~~", 12, 0, 65, 55, 250, 173, 0x131313)
		
		-- dlg_live2d.BK:AddButton(path.."live2d/baocun.BMP", path.."live2d/baocun.BMP", path.."live2d/baocun.BMP",0,150, 88, 31)
		-- dlg_live2d.BK:AddButton(path.."live2d/duqu.BMP", path.."live2d/duqu.BMP", path.."live2d/duqu.BMP",94,150, 88, 31)
		
		--购买
		dlg_live2d.Shop = dlg_live2d.BK:AddButton(path.."live2d/sc_1.BMP", path.."live2d/sc_2.BMP", path.."live2d/sc_3.BMP",61,99, 60, 25)
		
		dlg_live2d.Shop.script[XE_LBUP] = function()
			XShopUiIsClick(1)
			-----跳到商城英雄界面
			Set_JumpToShopHero()
		end
			
		-- --职介切换
		-- dlg_live2d.Switch = dlg_live2d.BK:AddButton(path.."live2d/zhijiebianshen.BMP", path.."live2d/zhijiebianshen.BMP", path.."live2d/zhijiebianshen.BMP",282,150, 88, 31)
		-- dlg_live2d.Switch.script[XE_LBUP] = function()
			-- XSwitchLive2D(wnd_live2d.id, Currunt_HeroId, Currunt_SkinId)
		-- end

		-- --立绘
		-- dlg_live2d.Hide = dlg_live2d.BK:AddButton(path.."live2d/lihui.BMP", path.."live2d/lihui.BMP", path.."live2d/lihui.BMP",376,150, 88, 31)
		-- dlg_live2d.Hide.script[XE_LBUP] = function()
			-- if click_live2d ~= 0 then
				-- click_live2d = click_live2d + 1
			-- end
			
			-- dlg_live2d.BK:SetVisible(0)
			-- dlg_live2d.Show:SetVisible(0)
			-- btn_switchsuper:SetVisible(1)
			-- btn_live2d:SetVisible(1)
			-- XShowLive2D(wnd_live2d.id, 0)
			
			-- if Panel_Super ~= nil then
				-- Panel_Super:Close()
				-- Panel_Super = nil
				-- Panel_BK:SetVisible(0)
				-- Panel_BK_F:SetVisible(0)
				-- Panel_BK_B:SetVisible(0)
			-- end
		-- end

		-- --关闭
		-- dlg_live2d.Close = dlg_live2d.BK:AddButton(path.."live2d/guanbiduihua.BMP", path.."live2d/guanbiduihua.BMP", path.."live2d/guanbiduihua.BMP",470,150, 88, 31)
		-- dlg_live2d.Close.script[XE_LBUP] = function()
			-- dlg_live2d.BK:MoveBy(0,245,0.5)
		-- end
	end
	
	if dlg_live2d.BK ~= nil then
		dlg_live2d.BK:SetVisible(show)
		--dlg_live2d.Show:SetVisible(show)
	end
end

function ShowLive2dWords(words)
	if Live2D_Pop ~= nil then
		if words == "NullValue" then
			Live2D_Pop:SetVisible(0)
			Live2D_Bubble:SetVisible(0)
		elseif words == "" then
			Live2D_Pop:SetVisible(0)
			Live2D_Bubble:SetVisible(1)
		else
			Live2D_Pop:SetVisible(1)
			Live2D_PopFont:SetFontText(words,0xf69752)
			Live2D_Bubble:SetVisible(0)
		end
	end
end

function RefreshLive2dDlg()
	local show = 0
	if Currunt_HeroId == 168 then
		local have = XIsHaveSuperSkin(Currunt_HeroId, Currunt_SkinId)
		if dlg_live2d.BK ~= nil then
			if dlg_live2d.BK:IsVisible() then
				show  = 1
			end
			
			if have==true and show==1 then
				show = 0
			elseif have==false and show==0 then
				show = 1
			end
		end
	end
	
	ShowLive2dDlg(show)
end

function GameHall_DefaultHeroID()
	return MainHall_BKHeroId
end

function GameHall_DefaultSkinID()
	return MainHall_BKSkinId
end

function ShowLive2dEffect(path)
	if effect_live2d ~= nil then
		if path == "" or path == "null" then
			effect_live2d:SetVisible(0)
			effect_live2d:ChangeEffect("")
		else
			effect_live2d:ChangeEffect(path)
			effect_live2d:SetVisible(1)
		end
	end
end

local nLastIdx = 0
function PlayGameHallBKAnim(idx,path,wnd)
	path = path or ""
	if nLastIdx == 0 then
		if idx ~= 0 then
			Panel_rotate:SetVisible(1)
			Panel_rotate:FlyDown(path,wnd)
		end
	else
		if idx == 0 then
			Panel_rotate:FlyUp()
		else
			if nLastIdx < idx then
				Panel_rotate:TurnLeft(path,wnd)
			elseif nLastIdx > idx then
				Panel_rotate:TurnRight(path,wnd)
			end
		end
	end
	XClickPlaySound(UI_slip_new)
	nLastIdx = idx
end



function ReturnToGameHall(flag) 
	if flag == 1 then
		SetFourpartUIVisiable(1)
		SetCurTitleState_teadytime(1)			
	elseif flag == 0 then
	end
end





function ChangeHallOriginalBK(strpicture,index)
	nImageIndex = index
	SetImage_MainHallBK(strpicture,"")
end

function OpenCEFWebLink(mtype,x,y,w,h)
	XOpenCefButton(mtype,x,y,w,h)
end

--/cf4 OpenCEFWebLink 505 200 200 500 500