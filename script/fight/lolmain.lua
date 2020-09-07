 include("../Data/Script/Common/include.lua")

local Lvup = {}

-- 接收血条蓝条
local HP = nil
local MP = nil
local HP_RECOVER = "+0.0"
local MP_RECOVER = "+0.0"
local HP_FONT = nil	
local MP_FONT = nil
local HP_REC = nil
local MP_REC = nil
local SHIELD_FONT = nil
local Shield = "  " 
local HPprecent = 0
local MPprecent = 0
local ClickCount = 0

-- 绘制部分
local MAIN_HP = nil
local MAIN_MP = nil
local Skill_Frame =nil
local Skill_Frame2 =nil
local Skill_Main = {}
local Skill_Main_Active = {}
local Skill_CD = {}
-- local Skill_tip = {}
local Skill_Main_ColdTime = {5,5,5,5}
local Skill_NoLearn = {}				-- 技能未学习
local Skill_NoMp = {}					-- 技能没蓝
local Key_Mfont = {"Q","W","E","R"}
local Key_main = {}
local Status_main = {}
local icon_Main = {}
local Fream_Main = {}

local Key_Nfont = "T"
local Key_N = nil
local icon_N = path_fight.."Me_equip.BMP"
local Skill_N = nil

-- 眼
local Eye = {}
Eye.picpath = path_fight.."recall_fight.BMP"
Eye.BtnUnable = nil
Eye.Btn = nil
Eye.skillID = nil
Eye.coldTime = nil


-- 回城
local Backup = {}
Backup.picpath = path_fight.."recall_fight.BMP"
Backup.Btn = nil
Backup.skillID = nil


local PVEEquipbtn = nil


local PVEHoverbtn = nil


-- Master技能
local Summoner = {}
Summoner.picpath = {}
Summoner.BtnUnable = {}
Summoner.Btn = {}
Summoner.skillID = {}

-- 技能加点
local SkillUp = {}
SkillUp.Btn = {}
SkillUp.BtnUnable ={}
SkillUp.IsAble = {}
SkillUp.Points = 0
SkillUp.SkillUpNotice = nil

local StrengthenSkill = {}		-- 强化技能按钮
local StrengthenSKillId = {5196,5197,5198}

local Skill_assist = {}
local Key_Afont = {"B","Z","D","F"}
local Key_assist = {}
local posx_assist = {81, 41, 383, 423}
local icon_assist = {path_fight.."Me_equip.BMP",path_fight.."Me_equip.BMP",path_fight.."Me_equip.BMP",path_fight.."Me_equip.BMP"}

-- 技能点
local maxLv = {5,5,5,5}

-- 最大技能等级和当前技能等级
local SkillMaxLv = {}
local SkillCurLv = {}

-- 扩展技能（目前只有柯南具备）
local SkillEx = {}
SkillEx.Btn = {}
SkillEx.Pic = {}
SkillEx.kuang = {}
-- 被动技能遮罩
local Skill_N_NoLearn = nil
local Skill_N_NoMp = nil

local CDFontcolor = {0xffebd912} 

local mposy = 0
local WillBeDeadEffect = nil
local Effect_Click = nil

local TempImage = nil
local BackImage2 = nil
local Skill_Frame2 = nil

local PVESkill = {}--特殊技能
PVESkill.picpath = {}
PVESkill.skillID = {}
PVESkill.BtnUnable = {}
PVESkill.pic = {}
PVESkill.kuang = {}

local SkillScreamEffect = {}--全屏特效--默认路径水银灯e技能特效

local StartChijiEffect = nil--吃鸡开始
local StartSuoquanEffect = nil--缩圈开始


--add by lgy begin
local SelectPlayerButton = nil
local SelectPlayerID = -1
--end
function PlaySkillScreamEffect()
	-- --windowswidth = nil
    -- --windowsheight = nil
	-- --SetEffect_Scale
	local ScaleX = windowswidth*100/1280
	local ScaleY = windowsheight*100/800
	SkillScreamEffect:SetEffect_Scale(ScaleX,ScaleY)
	--SkillScreamEffect:SetPosition(ScaleX/2,ScaleY/2)
   	XPlayEffect(SkillScreamEffect.id,0)	
end
function CloseSkillScreamEffect()
    SkillScreamEffect:SetVisible(0)
end

-- 作用于自己的全屏特效
local FullScreenEffect = {
{"tx_201_s05_5_03.ini", "..\\Data\\Magic\\Skill\\201_shuiyindeng\\s05_E\\keep\\tx_201_s05_5_03.x"},	-- 水银灯
{"tx_213_s06_2_01.ini", "..\\Data\\Magic\\Skill\\213_luluxiu\\s06_R\\fire\\tx_213_s06_2_01.x"},
{"33247", "..\\Data\\Magic\\Common\\chiji\\zhanzhenshousuo\\fire\\tx_chiji_zhanzhenshousuo_fire_01.x"},
{"33248", "..\\Data\\Magic\\Common\\chiji\\zhanzhenshousuo\\fire\\tx_chiji_zhanzhenshousuo_fire_02.x"},
{"33249", "..\\Data\\Magic\\Common\\chiji\\zhanzhenshousuo\\fire\\tx_chiji_zhanzhenshousuo_fire_03.x"},
{"33250", "..\\Data\\Magic\\Common\\chiji\\zhanzhenshousuo\\fire\\tx_chiji_zhanzhenshousuo_fire_04.x"},
{"null", "..\\Data\\Magic\\Common\\chiji\\zhanzhengkaishi\\fire\\tx_chiji_zhanzhengkaishi_fire_01.x"},
{"tx_035_s06_5_01_skin3.ini", "..\\Data\\Magic\\Skill\\035_jiegeng\\s06_R\\keep\\tx_035_s06_5_03_skin3.x"},
{"tx_201_s05_5_03_skin1.ini", "..\\Data\\Magic\\Skill\\201_shuiyindeng\\s05_E\\keep\\tx_201_s05_5_03_skin1.x"},	-- 水银灯
{"tx_137_s04_3_02_skin2.ini", "..\\Data\\Magic\\Skill\\137_yinshi\\s04_raoluan\\keep\\tx_137_s04_3_02_skin2.x"},
{"tx_137_s05_5_01_skin2.ini", "..\\Data\\Magic\\Skill\\137_yinshi\\s05_feijian\\keep\\tx_137_s05_5_01_skin2.x"},
{"tx_137_s05_5_02_skin2.ini", "..\\Data\\Magic\\Skill\\137_yinshi\\s05_feijian\\keep\\tx_137_s05_5_02_skin2.x"},
{"tx_137_s05_5_03_skin2.ini", "..\\Data\\Magic\\Skill\\137_yinshi\\s05_feijian\\keep\\tx_137_s05_5_03_skin2.x"},
{"tx_242_s06_5_01.ini", "..\\Data\\Magic\\Skill\\242_panduola\\s06_R\\keep\\tx_242_s06_5_01.x"},
{"tx_201_s05_5_03_skin2.ini", "..\\Data\\Magic\\Skill\\201_shuiyindeng\\s05_E\\keep\\tx_201_s05_5_03_skin2.x"}
}

function CheckIsFullScreenEffectByLua(path)
	for i=1, #FullScreenEffect do
		if string.find(path, FullScreenEffect[i][1]) then
			return i
		end
	end
	
	return 0
end

function SkillScreamEffectChangeEffect(index)
	SkillScreamEffect:ChangeEffect(FullScreenEffect[index][2])
end

function InitLolmain_ui(wnd,bisopen)
	n_lolmain_ui = CreateWindow(wnd.id, (1920-1670)/2, 1080-126, 588, 126)
	InitMain_Lolmain(n_lolmain_ui)
	InitPVE_FightBag_ui(n_lolmain_ui,0)
	n_lolmain_ui:SetVisible(bisopen)
	XSetWndFlagEnabled(n_lolmain_ui.id, XF_ENABLERCLICKPROCESS, 0)
end

function StartChiji()
    SkillScreamEffect:ChangeEffect(ScreemEffect_7)
	PlaySkillScreamEffect()
end

function StartSuoquan()
	local ScaleX = windowswidth*100/1280
	local ScaleY = windowsheight*100/800
	StartSuoquanEffect:SetEffect_Scale(ScaleX,ScaleY)
	--SkillScreamEffect:SetPosition(ScaleX/2,ScaleY/2)
   	XPlayEffect(StartSuoquanEffect.id,0)
end

function EndSuoquan()
	StartSuoquanEffect:SetVisible(0)
end

function InitMain_Lolmain(wnd)
	WillBeDeadEffect = wnd:AddEffect("..\\Data\\Magic\\Common\\UI\\changnei\\binsi\\tx_c_ui_binsi_01.x",960,530,1920,1080)
	WillBeDeadEffect:SetVisible(0)
	
	SkillScreamEffect = wnd:AddEffectEX(ScreemEffect_1,0,0,1280,800,100)
	SkillScreamEffect:SetVisible(0)
	
	StartSuoquanEffect = wnd:AddEffect("..\\Data\\Magic\\Common\\chiji\\zhanzhenshousuo\\fire\\tx_chiji_zhanzhenshousuo_fire_01.x",0,0,1280,800)
	StartSuoquanEffect:SetVisible(0)
	
	TempImage = wnd:AddImage(path_lolINSKILL.."lolmain.BMP", 0, 0, 498, 79)
	TempImage:SetTouchEnabled(0)
	BackImage2 = wnd:AddImage(path_fight.."lolmain2.BMP",370,10,771,76)
	BackImage2:SetVisible(0)
	DisableRButtonClick( TempImage.id)
	SkillUp.BtnUnable[1] = wnd:AddImage(path_lolINSKILL.."levelup.BMP",284,-40,44,44)
	SkillUp.BtnUnable[1]:SetTransparent(0)
	SkillUp.BtnUnable[1]:SetTouchEnabled(0)
	
	for i=1,8 do
		if i > 4 then
			SkillUp.Btn[i] = wnd:AddButton(path_lolINSKILL.."levelup.BMP", path_lolINSKILL.."levelup2.BMP", path_lolINSKILL.."levelup3.BMP", 90+54*(i-5), -100, 50, 50)
		else	
			SkillUp.Btn[i] = wnd:AddButton(path_lolINSKILL.."levelup.BMP", path_lolINSKILL.."levelup2.BMP", path_lolINSKILL.."levelup3.BMP", 90+54*(i-1), -50, 50, 50)
		end
		SkillUp.Btn[i].script[XE_LBUP] = function()	
			XClickPlaySound(UI_click_new)
			XSkillUpLButtonDown(1,i-1)
		end
		SkillUp.Btn[i].script[XE_ONHOVER] = function()
			XSetImageTipPos(1)
		end
		SkillUp.Btn[i].script[XE_ONUNHOVER] = function()
			XSetImageTipPos(0)
		end
	end
	
	-- 强化技能
	for i=1, 3 do
		StrengthenSkill[i] = wnd:AddButton(path_fight.."levelup.BMP",path_fight.."levelup1.BMP",path_fight.."levelup.BMP",230+54*i,-40,44,44)
		StrengthenSkill[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			XLearnStrengthenSkill(StrengthenSKillId[i])
			lolmainVisibleStrengthenSkillBtn()
			XUpdateSkillPoint()
		end
	end
	
	-- 回城 
	Backup.Btn = wnd:AddImage(Backup.picpath,posx_assist[1], 24, 34, 34)
	DisableRButtonClick( Backup.Btn.id)
	Backup.Btn:SetTouchEnabled(1)	
	Backup.Btn.script[XE_LBDOWN] = function()	
		XBackOnLButtonUp(1)
	end
	
	-- 眼
	Eye.Btn = wnd:AddImage(Eye.picpath,posx_assist[2], 24, 34, 34)
	DisableRButtonClick( Eye.Btn.id)
	Eye.BtnUnable = Eye.Btn:AddImage(path_fight.."skill_nomp_S.BMP",-3,-3,39,38)
	Eye.BtnUnable:SetTouchEnabled(0)
	Eye.BtnUnable:SetVisible(0)
	DisableRButtonClick( Eye.BtnUnable.id)
	Eye.Btn:SetTouchEnabled(1)	
	Eye.Btn.script[XE_ONHOVER] = function()
		XEyeMouseOn(1)
		XSetImageTipPos(1)
	end
	Eye.Btn.script[XE_ONUNHOVER] = function()
		XEyeMouseLeave(1)
		XSetImageTipPos(0)
	end
	Eye.Btn.script[XE_LBUP] = function()	
		XEyeLButtonUp(1)
		Eye.Btn:EnableImageFlash(1,50)
	end
	
	Eye.Btn.script[XE_ALTLUP] = function()	
	    XSendCurInfo(INFOTYPE_SUMMONERSKILL, 0)
	end
	
	-- 初始化技能等级底图
	for	i = 1,4 do
		SkillMaxLv[i] = wnd:AddImage(path_fight.."maxLv_5_0.BMP",87+54*(i-1),55+mposy,56,8)	
	end
	
	-- Master技能
	for i =1,2 do
		Summoner.Btn[i] = wnd:AddImage(icon_assist[i],posx_assist[i+2], 23, 34, 34)
		DisableRButtonClick( Summoner.Btn[i].id)
		Summoner.BtnUnable[i] = Summoner.Btn[i]:AddImage(path_fight.."skill_nomp_S.BMP",-3,-3,39,38)
		DisableRButtonClick( Summoner.BtnUnable[i].id)
		Summoner.BtnUnable[i]:SetTouchEnabled(0)
		Summoner.BtnUnable[i]:SetVisible(0)
		Summoner.Btn[i]:SetTouchEnabled(1)	
		Summoner.Btn[i].script[XE_ONHOVER] = function()
			XHotkeyMouseOn(1,i-1,1)
			XSetImageTipPos(1)
		end
		Summoner.Btn[i].script[XE_ONUNHOVER] = function()
			XHotkeyMouseLeave(1)
			XSetImageTipPos(0)
		end
		Summoner.Btn[i].script[XE_LBUP] = function()	
			XSummonerSkillLButtonUp(1,i-1)
			Summoner.Btn[i]:EnableImageFlash(1,50)
		end
		
		Summoner.Btn[i].script[XE_ALTLUP] = function()
		    XSendCurInfo(INFOTYPE_SUMMONERSKILL, i)
		end
	end
	
	
	for i = 1,5 do
		PVESkill.pic[i] = wnd:AddImage(path_fight.."skill_nolearn_S.BMP",1135+36*i,-100,35,35)
		PVESkill.BtnUnable[i] = PVESkill.pic[i]:AddImage(path_fight.."skill_nomp_S.BMP",-3,-3,39,38)	
		PVESkill.BtnUnable[i]:SetVisible(0)
		PVESkill.kuang[i] = PVESkill.pic[i]:AddImage(path_fight.."iconkuang.BMP",-1,-1,36,36)	
		PVESkill.kuang[i]:SetTouchEnabled(0)
		DisableRButtonClick( PVESkill.pic[i].id) 
		PVESkill.pic[i].script[XE_LBUP] = function()
		    if PVESkill.skillID[i]~=nil and PVESkill.skillID[i]>0 then
		        XtryuseSpecialPVEskill(PVESkill.skillID[i])
			end
		end
		PVESkill.pic[i]:SetVisible(0)
	end
	
	-- 英雄技能
	for i=1,4 do
		Skill_Main[i] = wnd:AddImage(icon_Main[i], 0, 0, 48, 48)
		DisableRButtonClick( Skill_Main[i].id)
		Skill_Main_Active[i] = Skill_Main[i]:AddImage(path_fight.."skill_nolearn.BMP",0,0,48,48)
		Skill_Main_Active[i]:SetTransparent(0)
		Skill_Main_Active[i]:SetTouchEnabled(0)
		Skill_NoLearn[i] = Skill_Main[i]:AddImage(path_fight.."skill_nolearn.BMP",-3,-3,56,55)
		Skill_NoLearn[i]:SetTouchEnabled(0)
		Skill_NoLearn[i]:SetVisible(0)
		Skill_NoMp[i] = Skill_Main[i]:AddImage(path_fight.."skill_nomp.BMP",-3,-3,56,55)
		Skill_NoMp[i]:SetTouchEnabled(0)
		Skill_NoMp[i]:SetVisible(0)
		
		Skill_Main[i].script[XE_ONHOVER] = function()
			XHotkeyMouseOn(1,i-1,0)
			XSetImageTipPos(1)
		end
		Skill_Main[i].script[XE_ONUNHOVER] = function()
			XHotkeyMouseLeave(1)
			XSetImageTipPos(0)
		end
		Skill_Main[i].script[XE_LBUP] = function()
			XHotkeyLButtonUp(1,i-1)
			Skill_Main[i]:EnableImageFlash(1,50)
		end	
		Skill_Main[i].script[XE_ALTLUP] = function()
		    XSendCurInfo(INFOTYPE_SKILL, i)
		end
	end
	
	-- 英雄扩展技能(目前只有柯南)
	for i = 1,3 do
		SkillEx.Btn[i] = wnd:AddImage(SkillEx.Pic[i],255+54*i,3-200,48,48) 
		SkillEx.Btn[i]:SetVisible(0)
		SkillEx.Btn[i]:SetTouchEnabled(1)
		SkillEx.kuang[i] = SkillEx.Btn[i]:AddImage(path_lolShopingCar.."daojukuang.BMP",-1,-1,50,50) 
		SkillEx.kuang[i]:SetTouchEnabled(0)
		
		SkillEx.Btn[i].script[XE_LBUP] = function()	
			XSkillExLButtonUp(1,i-1)
			SkillEx.Btn[i]:EnableImageFlash(1,50)
		end	
	end
	
	-- 被动技能
	Skill_N = wnd:AddImage(icon_N,44,20,40,40) 
	Skill_N_NoLearn = Skill_N:AddImage(path_fight.."skill_nolearn_S.BMP",-3,-3,45,45)
	Skill_N_NoLearn:SetTouchEnabled(0)
	Skill_N_NoLearn:SetVisible(0)
	Skill_N_NoMp = Skill_N:AddImage(path_fight.."skill_nomp_S.BMP",-3,-3,45,45)
	Skill_N_NoMp:SetTouchEnabled(0)
	Skill_N_NoMp:SetVisible(0)
	Skill_N:SetTouchEnabled(1)
	DisableRButtonClick( Skill_N.id)
	Skill_N.script[XE_LBUP] = function()	
		XTalentLButtonUp(1)
		Skill_N:EnableImageFlash(1,50)
	end
	Skill_N.script[XE_ALTLUP] = function()	
        XSendCurInfo(INFOTYPE_SKILL, 5)
    end	
	
	Skill_N.script[XE_ONHOVER] = function()	
		XTalentMouseOn(1)
		XSetImageTipPos(1)
	end
	Skill_N.script[XE_ONUNHOVER] = function()	
		XTalentMouseLeave(1)
		XSetImageTipPos(0)
	end
	
	-- 血蓝条和数值显示
	MAIN_HP = wnd:AddImage(path_lolINSKILL.."T_HP.BMP",46-11,65+mposy,239,11)
	MAIN_HP:SetAddImageRect(MAIN_HP.id, 0, 0, 239*HPprecent, 11, 46 ,65+mposy, 239*HPprecent, 11)	
	MAIN_MP = wnd:AddImage(path_lolINSKILL.."T_MP.BMP",46,65+mposy,239,11)
	MAIN_MP:SetAddImageRect(MAIN_MP.id, 0, 0, 239*MPprecent, 11, 46 ,81+mposy, 239*MPprecent, 11)	
	
	Skill_Frame = wnd:AddImage(path_lolINSKILL.."Skill_BK.BMP",0,0,498,79)
	Skill_Frame:SetTouchEnabled(0)
	
	Skill_Frame2 = wnd:AddImage(path_fight.."Skill_BK2.BMP",609-159,0-11,239,54)
	Skill_Frame2:SetTouchEnabled(0)
	Skill_Frame2:SetVisible(0)
	
	SkillUp.SkillUpNotice = wnd:AddFontEx("升 级！ + "..SkillUp.Points,15,0,0,-32,200,20,0xe3e38d)
	SkillUp.SkillUpNotice:SetVisible(0)

	Key_assist[1] = Backup.Btn:AddFont(Key_Afont[1],15,0,-5,15,20,20,0xb4ffff)
	Key_assist[1]:SetFontBackground()

	Key_assist[2] = Eye.Btn:AddFont(Key_Afont[2],15,0,-5,15,20,20,0xb4ffff)
	Key_assist[2]:SetFontBackground()
	
	for i =1,2 do
		Key_assist[i+2] = Summoner.Btn[i]:AddFont(Key_Afont[i+2],15,0,-5,15,20,20,0xb4ffff)
		Key_assist[i+2]:SetFontBackground()
	end

	for i=1,4 do
		Key_main[i] = Skill_Main[i]:AddFont(Key_Mfont[i],15,0,-3,30,20,20,0xb4ffff)
		Key_main[i]:SetFontBackground()
	end	
	for i=1,4 do
		Status_main[i] = Skill_Main[i]:AddFont("",15,6,0,-28,51,14,0xFFFFFF)
		Status_main[i]:SetFontBackground()
	end		

	Key_N = Skill_N:AddFont(Key_Nfont,15,0,-3,15,20,20,0xb4ffff)
	Key_N:SetVisible(0)
	
	local HPFont1 = CreateWindow(wnd.id, 6, 64, 241, 13)
	local HPFont2 = CreateWindow(wnd.id, 252, 64, 241, 13)
	HP_FONT = HPFont1:AddFont(HP,11,8,0,0,239,11,0xffffff)
	MP_FONT = HPFont2:AddFont(MP,11,8,0,0,239,11,0xffffff)
	
	SHIELD_FONT = HPFont1:AddFont(Shield,11,0,0,0,239,11,0xffffff)
	SHIELD_FONT:SetVisible(0)
	
	HP_REC = HPFont1:AddFont(HP_RECOVER,11,6,0,0,239,11,0xffffff)
	MP_REC = HPFont2:AddFont(MP_RECOVER,11,6,0,0,239,11,0xffffff)
	
	Effect_Click = wnd:AddEffect("..\\Data\\Magic\\Common\\UI\\changnei\\xinshouyindao\\tx_UI_CN_xinshouyindao_fire_01.x",0,0,44,44)
	Effect_Click:SetVisible(0)
	
	
	SelectPlayerButton = wnd:AddButton(path_setup.."btn1_mail.BMP", path_setup.."btn2_mail.BMP", path_setup.."btn3_mail.BMP", 598+54,-50, 100, 32)
	SelectPlayerButton:AddFont("确定", 15, 8, 0, 0, 100, 32, 0xc7bcf6)
	SelectPlayerButton.script[XE_LBUP] = function()	
		--发送消息
		if SelectPlayerID ~= -1 then
			--XChatSendGMMsg("/transform " .. SelectPlayerID)
			XSelectPlayerMsg(SelectPlayerID)
			SelectPlayerButton:SetVisible(0)
		end
	end	
	
	SelectPlayerButton:SetVisible(0)
end

function SetSelectPlayerButtonVisible(playerID)
	if playerID ~= -1 then
		SelectPlayerButton:SetVisible(1)
	else
		SelectPlayerButton:SetVisible(0)
	end
	SelectPlayerID = playerID
end

function SetPVESkillVisible(index)
    if index<6 and index>0 then
        PVESkill.pic[index]:SetVisible(0)
	end
end

function SetPVESkillData(index,picpath,skillID, tips)
    if index<6 and index>0 then
	    PVESkill.picpath[index] = picpath
		PVESkill.skillID[index] = skillID
		PVESkill.pic[index].changeimage("..\\"..picpath)
		PVESkill.pic[index]:SetVisible(1)
		PVESkill.pic[index]:SetImageTip(tips)
	end
end

function ClearPVEskillData()
    for index = 1,5 do
	    PVESkill.pic[index].changeimage(path_fight.."skill_nolearn.BMP")
		PVESkill.pic[index]:SetVisible(0)
		PVESkill.BtnUnable[index]:SetVisible(0)
	end
	PVESkill.picpath = {}
	PVESkill.skillID = {}
end


function SetSpecialPVEskillEnble(index , ibool)
    if index<6 and index>0 then
	    if ibool == 1 then
            PVESkill.BtnUnable[index]:SetVisible(0)
		else
		    PVESkill.BtnUnable[index]:SetVisible(1)
		end	
	end
end

function SetPve_LOLMain_UIEnble(ibool)--PVE影藏部分界面
     if(ibool == 1) then
	    for i=1,2 do
		    Summoner.Btn[i]:SetVisible(1)
		end
		Eye.Btn:SetVisible(1)
	    Backup.Btn:SetVisible(1) 
		Skill_Frame:SetVisible(1)
		Skill_Frame2:SetVisible(0)
		
	   TempImage:SetVisible(1)
       BackImage2:SetVisible(0)
	 elseif(ibool ==0) then
	     for i=1,2 do
		    Summoner.Btn[i]:SetVisible(0)
		end
		Eye.Btn:SetVisible(0)
	    Backup.Btn:SetVisible(0) 
		Skill_Frame:SetVisible(0)
		Skill_Frame2:SetVisible(1)
		
		TempImage:SetVisible(0)
        BackImage2:SetVisible(1)
	 end
end


-- 接收眼
function LoLMain_ReciveEye(picpath,skillID,skill_tip,backtip)
	Eye.picpath = "..\\"..picpath
	Eye.Btn.changeimage(Eye.picpath)
	Eye.Btn:SetImageTip(skill_tip)
	Backup.Btn:SetImageTip(backtip)
end

-- 接收技能升级加点
function LoLMain_ReciveSkillUp(idx,isCanSkillUp,Points,tip)
	SkillUp.Points = Points
	SkillUp.IsAble[idx+1] = isCanSkillUp
	
	if StrengthenSkill[1]:IsVisible() or StrengthenSkill[2]:IsVisible() or StrengthenSkill[3]:IsVisible() then
		return
	end
	
	if SkillUp.Btn[idx+1] == nil then
		return
	end

	if SkillUp.Points == 0 then
		SkillUp.SkillUpNotice:SetVisible(0)
		for i = 1,#SkillUp.Btn do
			SkillUp.Btn[i]:SetVisible(0)
		end
	else
		if	SkillUp.IsAble[idx+1] == 1 then
			SkillUp.Btn[idx+1]:SetVisible(1)
			SkillUp.Btn[idx+1]:SetImageTip(tip)
		else
			SkillUp.Btn[idx+1]:SetVisible(0)
		end
		
		SkillUp.SkillUpNotice:SetFontText("升 级！ + "..SkillUp.Points,0xe3e38d)
		SkillUp.SkillUpNotice:SetVisible(1)
		
		if SkillUp.Btn[5]:IsVisible() or SkillUp.Btn[6]:IsVisible() or SkillUp.Btn[7]:IsVisible() then
			SkillUp.SkillUpNotice:SetPosition(0,-32)
		else
			SkillUp.SkillUpNotice:SetPosition(0,-32)
		end
	end
end

function LoLMain_SkillAllSetEnablefalse()
	for i = 1,8 do 
		SkillUp.Btn[i]:SetVisible(0)
	end
	SkillUp.SkillUpNotice:SetVisible(0)
end

function lolmainVisibleStrengthenSkillBtn()
	XSetIsCanLearnSkill(1)
	for i = 1, #StrengthenSkill do
		StrengthenSkill[i]:SetVisible(0)
	end
end

function LoLMain_SkillAllSetOneSkillEnableTrue(index)
	SkillUp.Btn[index]:SetVisible(1)
	SkillUp.SkillUpNotice:SetVisible(1)
end

-- 初始化英雄技能等级显示
function LoLMain_ReciveMaxSkillLv(index,MaxLv)
	local idx = index + 1
	maxLv[idx] = MaxLv
end

-- 英雄技能等级变更
function LoLMain_ReciveSkillLvChange(index,curlv)
	if curlv == -1 then 
		SkillMaxLv[index+1].changeimage(path_fight.."maxLv_"..maxLv[index+1].."_0.BMP")
	elseif curlv == 0 then
		SkillMaxLv[index+1].changeimage(path_fight.."maxLv_"..maxLv[index+1].."_0.BMP")
	elseif curlv == 30 then--君莫笑
		SkillMaxLv[index+1].changeimage(path_fight.."maxLv_30.BMP")
	elseif curlv ~= 0 then 
		if curlv > maxLv[index+1] then
			curlv = maxLv[index+1]
		end
		SkillMaxLv[index+1].changeimage(path_fight.."maxLv_"..maxLv[index+1].."_"..curlv..".BMP")
	end	
	-- log("1111111111112")
end

-- 小悟空被动技能快捷键显示
function LoLMain_ReciveTalentKey(isVisible)
	if isVisible == 1 then
		Key_N:SetVisible(1)
	elseif isVisible == 0 then
		Key_N:SetVisible(0)
	end 
end

-- 未学技能遮罩
function LoLMain_ReciveIsLearn(idx,IsLearn)
	if idx == 5 then
		if IsLearn == 1 then 
			Skill_N_NoLearn:SetVisible(0)
		elseif IsLearn == 0 then
			Skill_N_NoLearn:SetVisible(1)
		end
	else
		if IsLearn == 1 then 
			Skill_NoLearn[idx]:SetVisible(0)
		elseif IsLearn == 0 then
			Skill_NoLearn[idx]:SetVisible(1)
		end
	end	
end

-- 无蓝技能遮罩
function LoLMain_ReciveIsEnoughMp(idx,IsMpEnough)
	if idx == 5 then
		if IsMpEnough == 1 then 
			Skill_N_NoMp:SetVisible(0)
		elseif IsMpEnough == 0 then
			Skill_N_NoMp:SetVisible(1)
		end
	else
		if IsMpEnough == 1 then 
			Skill_NoMp[idx]:SetVisible(0)
		elseif IsMpEnough == 0 then
			Skill_NoMp[idx]:SetVisible(1)
		end
	end	
end

-- Master技能特殊状态遮罩
function LoLMain_ReciveSummonerCover(idx,IsCover)
	if IsCover == 1 then 
		Summoner.BtnUnable[idx]:SetVisible(1)
	elseif IsCover == 0 then
		Summoner.BtnUnable[idx]:SetVisible(0)
	end
end

-- 眼特殊状态遮罩
function LoLMain_ReciveEyeCover(IsCover)
	if IsCover == 1 then 
		Eye.BtnUnable:SetVisible(1)
	elseif IsCover == 0 then
		Eye.BtnUnable:SetVisible(0)
	end
end

-- 接收技能图片
function LoLMain_ReciveSkillImg(picpath,index,skill_tip)
	if Skill_Main[index+1] ~= nil and string.find(picpath, "Head") == nil then
		icon_Main[index+1] = "..\\"..picpath
		Skill_Main[index+1].changeimage(icon_Main[index+1])
		Skill_Main[index+1]:SetImageTip(skill_tip)
	end
end

-- 眼冷却
function LoLMain_ReciveEyeCD(CDtime)
	if Eye.Btn ~= nil then
		Eye.Btn:SetImageColdTimeFontSize(30)
		Eye.Btn:SetImageColdTimeFontColor(0xffebd912)
		Eye.Btn:SetImageColdTimeType(0)
		Eye.Btn:SetImageColdTime(CDtime)
	end
end
 
-- 切换英雄或者Clearskillcd
function LoLMain_ClearSkillCD()
	for i = 1,4 do 
		Skill_Main[i]:SetImageColdTime(0)
	end 
	Skill_N:SetImageColdTime(0)
	for i = 1,2 do
		Summoner.Btn[i]:SetImageColdTime(0)
	end
end

function LoLMain_ReciveSkillAnimate(index,isvisible)
	Skill_Main_Active[index+1]:EnableImageAnimate(isvisible,0,25,5)
end

function LoLMain_ReciveSkillFlash(index)
	Skill_Main[index+1]:EnableImageFlash(1,50)
end

function LoLMain_ReciveSummonerSkillFlash(index)
	Summoner.Btn[index+1]:EnableImageFlash(1,50)
end

function LoLMain_ReciveEyeFlash()
	Eye.Btn:EnableImageFlash(1,50)
end

-- 英雄二段技能冷却
function LoLMain_ReciveSecSkillCD(index,CDtime,color,starttime)	
	XSetImageValidColdTime(Skill_Main[index+1].id, CDtime, starttime)
end 

-- 英雄技能冷却
function LoLMain_ReciveSkillCD(index,CDtime,color,starttime)	
	if Skill_Main[index+1] ~= nil then
		Skill_Main[index+1]:SetImageColdTimeFontSize(30)
		Skill_Main[index+1]:SetImageColdTimeType(0)
		Skill_Main[index+1]:SetImageColdTimeNeedMask(color)
		if color == 1 then 	
			Skill_Main[index+1]:SetImageColdTimeFontColor(0xffebd912)
		elseif color == 0 then	
			Skill_Main[index+1]:SetImageColdTimeFontColor(0xff33d95e)
		end
		Skill_Main[index+1]:SetImageColdTimeEx(CDtime,starttime,1)
	end
end 

-- Master技能冷却
function LoLMain_ReciveSummonerSkillCD(index,CDtime)
	if Summoner.Btn[index+1] ~= nil then
		Summoner.Btn[index+1]:SetImageColdTimeFontSize(30)
		Summoner.Btn[index+1]:SetImageColdTimeFontColor(0xffebd912)
		Summoner.Btn[index+1]:SetImageColdTimeType(0)
		Summoner.Btn[index+1]:SetImageColdTime(CDtime)
	end
end

function LoLMain_ReciveTalentSkillCD(CDtime)
	if Skill_N ~= nil then
		Skill_N:SetImageColdTimeFontSize(30)
		Skill_N:SetImageColdTimeFontColor(0xffebd912)
		Skill_N:SetImageColdTimeType(0)
		Skill_N:SetImageColdTime(CDtime)
	end
end

-- 技能扩展
function LoLMain_ReciveSkillEx(picpath,index,tip)
	if SkillEx.Btn[index+1] ~= nil then
		SkillEx.Pic[index+1] = "..\\"..picpath
		SkillEx.Btn[index+1].changeimage(SkillEx.Pic[index+1])
		SkillEx.Btn[index+1]:SetImageTip(tip)
	end
end	
	
-- 技能扩展是否显示
function LoLMain_ReciveSkillExIsVisible(isVisible)
	if isVisible == 0 then 
		for i = 1,3 do 
			--SkillEx.Btn[i]:SetImageTip(0)
			SkillEx.Btn[i]:SetVisible(0)			
		end
	else 
		for i = 1,3 do 
			SkillEx.Btn[i]:SetVisible(1)
		end	
	end
end
	
-- 接收被动技能图片
function LoLMain_ReciveTalentImg(picpath,skill_tip)
	if Skill_N ~= nil then
		icon_N = "..\\"..picpath
		Skill_N.changeimage(icon_N)
		Skill_N:SetImageTip(skill_tip)
	end
end

-- 接收Master技能图片
function LoLMain_ReciveSummonerSkillImg(picpath,index,skill_tip)
	if Summoner.Btn[index+1] ~= nil then
		Summoner.picpath[index+1] = "..\\"..picpath
		Summoner.Btn[index+1].changeimage(Summoner.picpath[index+1])
		Summoner.Btn[index+1]:SetImageTip(skill_tip)
	end
end

-- 刷新快捷键FONT
function LoLMain_ClearKeyFont()
	for i = 1,4 do
		Key_assist[i]:SetFontText(" ",0xb4ffff)
		Key_main[i]:SetFontText(" ",0xb4ffff)
	end
	Key_N:SetFontText(" ",0xb4ffff)		
end

-- 接收修改键位后的按键信息，用于显示技能快捷键
function LoLMain_ReciveKeyFont(idx,KeyFont)
	if idx == 85 then
		Key_assist[1]:SetFontText(KeyFont,0xb4ffff)
	elseif idx == 117 then
		Key_assist[2]:SetFontText(KeyFont,0xb4ffff)	
	elseif idx == 86 then
		if KeyFont~="" then
			Key_assist[3]:SetFontText(KeyFont,0xb4ffff)	
		else
			Key_assist[3]:SetFontText("",0xb4ffff)
		end
	elseif idx == 87 then
		if KeyFont~="" then
			Key_assist[4]:SetFontText(KeyFont,0xb4ffff)	
		else
			Key_assist[4]:SetFontText("",0xb4ffff)	
		end
	elseif idx == 31 then
		if KeyFont~="" then
			Key_main[1]:SetFontText(KeyFont,0xb4ffff)	
		else 
			Key_main[1]:SetFontText("",0xb4ffff)
		end
	elseif idx == 32 then
		if KeyFont~="" then
			Key_main[2]:SetFontText(KeyFont,0xb4ffff)
		else	
			Key_main[2]:SetFontText("",0xb4ffff)
		end	
	elseif idx == 33 then
		if KeyFont~="" then
			Key_main[3]:SetFontText(KeyFont,0xb4ffff)	
		else	
			Key_main[3]:SetFontText("",0xb4ffff)
		end	
	elseif idx == 34 then
		if KeyFont~="" then
			Key_main[4]:SetFontText(KeyFont,0xb4ffff)	
		else	
			Key_main[4]:SetFontText("",0xb4ffff)
		end		
	elseif idx == 35 and KeyFont~="" then
		Key_N:SetFontText(KeyFont,0xb4ffff)
	end
end

-- 技能右上角对应状态的层数
function LoLMain_StatusNum(i,num)
	if num<=0 then
		num = ""
	end
	Status_main[i]:SetFontText(num,0xFFFFFF)
end

-- 英雄护盾值显示
function LoLMain_ReciveShield(isShield,shield)
	if isShield == 1 then
		SHIELD_FONT:SetFontText(shield,0xffffff)
		SHIELD_FONT:SetVisible(1)
	else
		SHIELD_FONT:SetVisible(0)
	end 
end

-- 自己的血条蓝条显示
function LoLMain_ReciveHpAndMp(hp,hpPre,mp,mpPre,hprecover,mprecover,mpkind)
	HP = hp
	MP = mp
	HPprecent = hpPre
	MPprecent = mpPre
	HP_RECOVER = hprecover
	MP_RECOVER = mprecover

	if HPprecent>1 then
		HPprecent = 1
	end
	if MPprecent>1 then
		MPprecent = 1
	end
	if mpkind ~= 0 then
		if MPprecent ~= 0 then
			MAIN_MP:SetVisible(1)
			MP_FONT:SetVisible(1)
		end		
	else
		MAIN_MP:SetVisible(0)
		MP_FONT:SetVisible(0)
		MP_REC:SetVisible(0)
	end
	if mpkind == 1 then
		MAIN_MP.changeimage(path_lolINSKILL.."T_MP.BMP")
		MP_REC:SetVisible(1)
	elseif mpkind == 2 then
		MP_REC:SetVisible(0)
		MAIN_MP.changeimage(path_lolINSKILL.."T_ENERGY.BMP")
	elseif mpkind == 3 then
		MP_REC:SetVisible(0)
		MAIN_MP.changeimage(path_lolINSKILL.."T_DENDER.BMP")
	end
	local scale = 1
	if (windowswidth>2000) then
		scale = TWOKSCALE
	end	
	
	if HPprecent ~= 0 then
		HP_FONT:SetFontText(HP)
		MAIN_HP:SetAddImageRect(MAIN_HP.id, 0, 0, 239*(HPprecent), 11, 6*scale, 64*scale-15, 241*(HPprecent)*scale, 13*scale)--血条位置
		
		HP_REC:SetFontText(HP_RECOVER)
		MAIN_MP:SetAddImageRect(MAIN_MP.id, 0, 0, 239*(MPprecent), 11, 6*scale, 64*scale, 241*(MPprecent*scale), 13*scale)--蓝条位置
		
		MP_FONT:SetFontText(MP)
		MP_REC:SetFontText(MP_RECOVER)
	else
		HP_FONT:SetFontText(HP)
		MAIN_HP:SetAddImageRect(MAIN_HP.id, 0, 0, 239*(HPprecent), 11, 6*scale, 64*scale-15, 241*(HPprecent)*scale, 13*scale)
		
		HP_REC:SetFontText(HP_RECOVER)
		MAIN_MP:SetAddImageRect(MAIN_MP.id, 0, 0, 239*(MPprecent), 11, 6*scale, 64*scale, 241*(MPprecent*scale), 13*scale)
		
		MP_FONT:SetFontText(MP)
		MP_REC:SetFontText(MP_RECOVER)
	end
end


function SetEffectMainTutorial(cIsEnabled)
	SkillUp.BtnUnable[1]:EnableImageAnimateEX(cIsEnabled, 7, 90, 5, 50, 5, -40)
end

function GetMainSkillUiPos()
	local l,t,r,b = Skill_N:GetPosition()
	XGetMainSkillUiPos(l,t,r,b)
end

-- 设置显示
function SetLolmainIsVisible(flag) 
	if n_lolmain_ui ~= nil then
		if flag == 1 and n_lolmain_ui:IsVisible() == false then
			WillBeDeadEffect:SetVisible(0)
			n_lolmain_ui:SetVisible(1)
			StartSuoquanEffect:SetVisible(0)
		elseif flag ==0 and n_lolmain_ui:IsVisible() == true then		    
			WillBeDeadEffect:SetVisible(0)
			n_lolmain_ui:SetVisible(0)
			Effect_Click:SetVisible(0)
			CloseSkillScreamEffect()
			StartSuoquanEffect:SetVisible(0)
		end
		
	end
end

function GetLolmainIsVisible()  
    if(n_lolmain_ui ~= nil and n_lolmain_ui:IsVisible()) then
		return 1
    else
		return 0
    end
end

function PlayWillDeadEffect(bVisible)
	if WillBeDeadEffect:IsVisible() == false and bVisible == 1 then
		XSetEffectPos(WillBeDeadEffect.id, windowswidth/2, windowsheight/2)
		WillBeDeadEffect:SetEffect_Scale(100*(windowswidth/1920),100*(windowsheight/1080))		
		XPlayEffect(WillBeDeadEffect.id,1)
	elseif WillBeDeadEffect:IsVisible() == true and bVisible == 0 then
		WillBeDeadEffect:SetVisible(0)
	end
end

function ChangeWillDeadEffectPos()
	if WillBeDeadEffect:IsVisible() then
		XSetEffectPos(WillBeDeadEffect.id, windowswidth/2, windowsheight/2)
		WillBeDeadEffect:SetEffect_Scale(100*(windowswidth/1920),100*(windowsheight/1080))
	end
end

function PlaySkillLearnEffect(index)
	local scale = 1
	if (windowswidth>2000) then
		scale = TWOKSCALE
	end
	if(n_lolmain_ui ~= nil and n_lolmain_ui:IsVisible()) then
		-- 播放特效
		local l,t = SkillUp.Btn[index]:GetPosition()
		XSetEffectPos(Effect_Click.id, l+27*scale, t+74*scale)
		Effect_Click:SetEffect_Scale(100*scale,100*scale)
		XPlayEffect(Effect_Click.id, 0)
	end
end

function GetLolMainButtonPos()
	if SkillUp.Btn[1] ~= nil then
		local l,t = SkillUp.Btn[1]:GetPosition()
		return l,t
	else
		return 0,0
	end
end
function ScaleLolmain(width, height)
	ScalePVEMain(width,height)
	local scale = 1
	if (width>2000) then
		scale = TWOKSCALE
	end
	
	n_lolmain_ui:SetPosition((width-498*scale)/2, height-79*scale)
	
	TempImage:SetPosition(0, 0)
	TempImage:SetWH(498*scale,79*scale)
	BackImage2:SetPosition(370*scale,10*scale)
	BackImage2:SetWH(771*scale,76*scale)
	
	SkillUp.BtnUnable[1]:SetPosition(284*scale,-40*scale)
	SkillUp.BtnUnable[1]:SetWH(44*scale,44*scale)
	for i=1,8 do
		if i > 4 then
			SkillUp.Btn[i]:SetPosition((165+54*(i-5))*scale,(-100)*scale)
			SkillUp.Btn[i]:SetWH(50*scale,50*scale)
		else
			SkillUp.Btn[i]:SetPosition((165+54*(i-1))*scale,(-50)*scale)
			SkillUp.Btn[i]:SetWH(50*scale,50*scale)
		end
	end
	
	Backup.Btn:SetPosition(posx_assist[1]*scale,24*scale)
	Backup.Btn:SetWH(34*scale,34*scale)
	
	Eye.Btn:SetPosition(posx_assist[2]*scale,24*scale)
	Eye.Btn:SetWH(34*scale,34*scale)
	
	Eye.BtnUnable:SetPosition(-3*scale,-3*scale)
	Eye.BtnUnable:SetWH(39*scale,38*scale)
	
	for	i = 1,4 do
		SkillMaxLv[i]:SetPosition((162+54*(i-1))*scale,(54+mposy)*scale)
		SkillMaxLv[i]:SetWH(56*scale,8*scale)
	end
	
	for i =1,2 do
		Summoner.Btn[i]:SetPosition(posx_assist[i+2]*scale, 23*scale)
		Summoner.Btn[i]:SetWH(34*scale,34*scale)
		
	    Summoner.BtnUnable[i]:SetPosition(-3*scale,-3*scale)
	    Summoner.BtnUnable[i]:SetWH(39*scale,38*scale)
	end
	
	for i = 1,5 do
		PVESkill.pic[i]:SetPosition((228+35*i)*scale,-100*scale)
		PVESkill.pic[i]:SetWH(32*scale,32*scale)
		
		PVESkill.kuang[i]:SetPosition(-1*scale,-1*scale)
		PVESkill.kuang[i]:SetWH(36*scale,36*scale)
	end
	
	for i=1,4 do
		Skill_Main[i]:SetPosition((167+54*(i-1))*scale, 1)
		Skill_Main[i]:SetWH(48*scale, 48*scale)
		
		Skill_Main_Active[i]:SetPosition(0,0)
		Skill_Main_Active[i]:SetWH(48*scale,48*scale)
		
		Skill_NoLearn[i]:SetPosition(-3*scale,-3*scale)
		Skill_NoLearn[i]:SetWH(56*scale,55*scale)
		
		Skill_NoMp[i]:SetPosition(-3*scale,-3*scale)
		Skill_NoMp[i]:SetWH(56*scale,55*scale)
	end
	
	for i = 1,3 do
		SkillEx.Btn[i]:SetPosition((255+54*i)*scale,(3-200)*scale)
		SkillEx.Btn[i]:SetWH(48*scale,48*scale)
		
		SkillEx.kuang[i]:SetPosition(-1*scale,-1*scale)
		SkillEx.kuang[i]:SetWH(50*scale,50*scale)		
	end
	
	Skill_N:SetPosition(120*scale, 18*scale)
	Skill_N:SetWH(42*scale, 42*scale)
	
	Skill_N_NoLearn:SetPosition(-3*scale,-3*scale)
	Skill_N_NoLearn:SetWH(45*scale,45*scale)	
	
	Skill_N_NoMp:SetPosition(-3*scale,-3*scale)
	Skill_N_NoMp:SetWH(45*scale,45*scale)
	
	Skill_Frame:SetPosition(0,0)
	Skill_Frame:SetWH(498*scale,79*scale)
	
	Skill_Frame2:SetPosition(609*scale,0)
	Skill_Frame2:SetWH(239*scale,54*scale)
	
	
	-- Font
	if scale>1 then--128,-45
		if SkillUp.Btn[5]:IsVisible() or SkillUp.Btn[6]:IsVisible() or SkillUp.Btn[7]:IsVisible() then
			SkillUp.SkillUpNotice:MoveWindow(0*scale,-32*scale,200*scale,20*scale)
		else
			SkillUp.SkillUpNotice:MoveWindow(0*scale,-32*scale,200*scale,20*scale)
		end
		
		Key_assist[1]:MoveWindow(-2*scale,17*scale,20*scale,20*scale)
		Key_assist[2]:MoveWindow(-3*scale,18*scale,20*scale,20*scale)
		
		for i =1,2 do
			Key_assist[i+2]:MoveWindow(-3*scale,18*scale,20*scale,20*scale)
		end
		for i=1,4 do
			Key_main[i]:MoveWindow(-2*scale,32*scale,20*scale,20*scale)
		end	
		
		Key_N:MoveWindow(-2*scale,17*scale,20*scale,20*scale)
		
	else
		if SkillUp.Btn[5]:IsVisible() or SkillUp.Btn[6]:IsVisible() or SkillUp.Btn[7]:IsVisible() then
			SkillUp.SkillUpNotice:MoveWindow(0*scale,-35*scale,200*scale,20*scale)
		else
			SkillUp.SkillUpNotice:MoveWindow(0*scale,-35*scale,200*scale,20*scale)
		end
		
		Key_assist[1]:MoveWindow(-5*scale,15*scale,20*scale,20*scale)
		Key_assist[2]:MoveWindow(-5*scale,15*scale,20*scale,20*scale)
		
		for i =1,2 do
			Key_assist[i+2]:MoveWindow(-5*scale,15*scale,20*scale,20*scale)
		end
		for i=1,4 do
			Key_main[i]:MoveWindow(-3*scale,30*scale,20*scale,20*scale)
		end	
		
		Key_N:MoveWindow(-3*scale,15*scale,20*scale,20*scale)
	end
	
	XSetEffectPos(WillBeDeadEffect.id,960,530)
	XSetEffectPos(SkillScreamEffect.id,0,0)
	XSetEffectPos(StartSuoquanEffect.id,0,0)
end

-- 强化技能按钮
function SetStrengthenSkillState(index, visible)
	StrengthenSkill[index]:SetVisible(visible)
end

function SetChiJiUi(flag)
	if flag == 1 then
		for i=1,2 do
			Summoner.Btn[i]:SetVisible(1)
		end
		Eye.Btn:SetVisible(0)
		Backup.Btn:SetVisible(0)
	else
		for i=1,2 do
			Summoner.Btn[i]:SetVisible(1)
		end
		Eye.Btn:SetVisible(1)
		Backup.Btn:SetVisible(1)
	end 
end

