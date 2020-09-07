include("../Data/Script/Common/include.lua")


----选择Master技能界面
local Assist_BK1 = nil
local SummonerSkill_ui = nil
local scissorwnd,scissorwndBG = nil
--滚动条
local scissor_toggleImg = nil
local scissor_togglebtn = nil
local DownMany = 0
local MAXSUMMONER = 30

local assist_icon = {}
local assist_hide = {}
local assist_side = {}
local assist_name = {}

------------------Master技能具体信息
local AskillInfo = {}
AskillInfo.strPictureName = {}	----技能图片路径
AskillInfo.strName = {}			----技能名称
AskillInfo.enabled = {}			----技能是否学习
AskillInfo.skillId = {}			----技能ID
local movex = 0
local movey = 0

function InitSummonerSkill_ui(wnd,bisopen)
	n_summonerskill_ui = CreateWindow(wnd.id, 676, 361, 472, 333)
	n_summonerskill_ui:EnableBlackBackgroundTop(1)
	InitMain_SummonerSkill(n_summonerskill_ui)
	n_summonerskill_ui:SetVisible(bisopen)
end

function InitMain_SummonerSkill(wnd)
	Assist_BK1 = wnd:AddImage(path_lolhero.."BK1_start.BMP",-650,100,472,333)
	Assist_BK1:AddFont("战斗技能",18,0,192+movex,25+movey,100,20,0xceaf61)
	Assist_BK1:AddImage(path_lolhero.."line.BMP",15+movex,47+movey,438,1)
	
	--assist_skillA = Assist_BK1:AddImage(path_equip.."bag_equip.BMP",208,-51,48,48)
	--assist_skillB = Assist_BK1:AddImage(path_equip.."bag_equip.BMP",208,-51,48,48)

	SummonerSkill_ui = CreateWindow(Assist_BK1.id, 0, 0, 472, 333)
	scissorwnd = CreateWindow(SummonerSkill_ui.id, 0, 0, 472, 333)
	scissorwnd:SetTouchEnabled(1)
	scissorwnd:SetWindowScissorRect(28, 60, 420, 300)
	scissorwndBG = CreateWindow(scissorwnd.id, 0, 0, 420, 300)
	for i=1,MAXSUMMONER do
		local posx = 90*((i-1)%5+1)-60+movex
		local posy = 90*math.ceil(i/5)-28+movey
		
		assist_icon[i] = scissorwndBG:AddImage(path_equip.."bag_equip.BMP",posx,posy,48,48)
		assist_side[i] = assist_icon[i]:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)
		assist_side[i]:SetTouchEnabled(0)
		assist_hide[i] = assist_icon[i]:AddImage(path_lolhero.."summonerEnabled_start.BMP",-2,-2,52,52)	
		assist_name[i] = assist_side[i]:AddFont("", 12, 8, 4, 0, 56, 130, 0xffe684)
		--------修改Master技能
		assist_icon[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			XSendAssistId(AskillInfo.skillId[i],i-1)	
		end
	end

	local Assist_CLOSE = Assist_BK1:AddButton(path_lolcommon.."close1.BMP",path_lolcommon.."close2.BMP",path_lolcommon.."close3.BMP",459,0,25,26)
	Assist_CLOSE.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
		SetSummonerSkillIsVisible(0)
	end
		
	-- 显示滚动条
	scissor_toggleImg = Assist_BK1:AddImage(path_lolhero.."toggleBK_main.BMP",456,62,1,250)
	scissor_togglebtn = scissor_toggleImg:AddButton(path_lolhero.."toggleBTN1_main.BMP",path_lolhero.."toggleBTN2_main.BMP",path_lolhero.."toggleBTN3_main.BMP",-2,0,5,140)
	local ToggleT = scissor_toggleImg:AddImage(path_lolhero.."TD1_main.BMP",-3,-9,7,9)
	local ToggleD = scissor_toggleImg:AddImage(path_lolhero.."TD2_main.BMP",-3,250,7,9)
	
	XSetWindowFlag(scissor_togglebtn.id,1,1,0,110)
	
	scissor_togglebtn:ToggleBehaviour(XE_ONUPDATE, 1)
	scissor_togglebtn:ToggleEvent(XE_ONUPDATE, 1)
	scissor_togglebtn.script[XE_ONUPDATE] = function()
		if scissor_togglebtn._T == nil then
			scissor_togglebtn._T = 0
		end
		local L,T,R,B = XGetWindowClientPosition(scissor_togglebtn.id)
		if scissor_togglebtn._T ~= T then
			
			scissor_togglebtn._T = T
			scissor_togglebtn:SetPosition(-2,T)
			DownMany = T
			if DownMany<0 then
				DownMany  = 0
			end
			local distanc = T/110*(90*math.ceil(#AskillInfo.strName/5)- 90)
			
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
	Assist_BK1:EnableEvent(XE_MOUSEWHEEL)
	Assist_BK1.script[XE_MOUSEWHEEL] = function()
		if n_summonerskill_ui:IsVisible() == false then
			return
		end
		if #AskillInfo.strName<=15 then
			return
		end
		local move = 90*math.ceil(#AskillInfo.strName/5)- 90
		
		local updownMove = 0
		local updown = XGetMsgParam0()
		if updown>0 then
			updownMove = -1*math.ceil(110/50)
		else
			updownMove = math.ceil(110/50)
		end
		
	    local btn_pos = scissor_togglebtn._T + updownMove
		if btn_pos < 0 then
			btn_pos = 0
		end
		if btn_pos >111 then
			btn_pos = 111
		end		
		DownMany = btn_pos
		scissor_togglebtn:SetPosition(-2,btn_pos)
		scissor_togglebtn._T = btn_pos
		
		local distanc = (btn_pos*move)/110
		local BGmove = (0 - distanc)
		if BGmove > 0 then
			BGmove = 0
		end
		if BGmove < -5000 then
			BGmove = -5000
		end	
		scissorwndBG:SetPosition(0,BGmove)		
	end
	
end
-------------处理Master技能的通信
function AssistSkill_Clean()
	AskillInfo = {}
	AskillInfo.strPictureName = {}	----技能图片路径
	AskillInfo.strName = {}			----技能名称
	AskillInfo.enabled = {}			----要求Master技能等级8级
	AskillInfo.skillId = {}			----技能ID
	
	for i,v in pairs(assist_icon) do
		assist_icon[i]:SetVisible(0)
	end
	
	DownMany = 0
	scissorwndBG:SetPosition(0,0)
	scissor_togglebtn:SetPosition(-2,0)
	scissor_togglebtn._T = 0
end
function SendAssistSkillDataToLua(m_strPictureName,m_strName,m_Enabled,m_skillId,tip)
	local size = #AskillInfo.strName+1
		--log("\nFFFFF    "..m_strName.."  |  "..m_strPictureName)
	AskillInfo.strPictureName[size] = m_strPictureName			--log("\nm_strPictureName   "..m_strPictureName)
	AskillInfo.strName[size] = m_strName								--log("\nm_strName   "..m_strName)
	AskillInfo.enabled[size] = m_Enabled								--log("\nm_Enabled   "..m_Enabled)
	AskillInfo.skillId[size] = m_skillId								--log("\nm_skillId   "..m_skillId)
	
	assist_icon[size].changeimage(AskillInfo.strPictureName[size])
	assist_icon[size]:SetImageTip(tip)
	assist_hide[size]:SetImageTip(tip)
	assist_name[size]:SetFontText(AskillInfo.strName[size],0xffe684)
	
	assist_icon[size]:SetVisible(1)
	assist_hide[size]:SetVisible(1-m_Enabled)
	
	if size <=15  then
		scissor_toggleImg:SetVisible(0)
	else
		scissor_toggleImg:SetVisible(1)
	end
end



-----------当前选中的第一个Master技能
function Current_summonerskillA(picture1,tip1)
	--assist_skillA.changeimage(picture1)
	--assist_skillA:SetImageTip(tip1)
end
-----------当前选中的第二个Master技能
function Current_summonerskillB(picture2,tip2)
	--assist_skillB.changeimage(picture2)
	--assist_skillB:SetImageTip(tip2)
end
-----------选择Master的背景图文字修改
function changeSummonerSkillIndex(index)
	if index==1 then
		Assist_BK1:SetVisible(1)
	elseif index==2 then
		Assist_BK1:SetVisible(1)
	elseif index==3 then
		Assist_BK1:SetVisible(1)
	end
end

-- 设置显示
function SetSummonerSkillIsVisible(flag) 
	if n_summonerskill_ui ~= nil then
		if flag == 1 and n_summonerskill_ui:IsVisible() == false then
			n_summonerskill_ui:CreateResource()
			n_summonerskill_ui:SetVisible(1)
			
			--XInGameLog("act=WINDOW,Function=SetSummonerSkillIsVisible,visible=true")
		elseif flag == 0 and n_summonerskill_ui:IsVisible() == true then
			n_summonerskill_ui:DeleteResource()
			n_summonerskill_ui:SetVisible(0)
			
			--XInGameLog("act=WINDOW,Function=SetSummonerSkillIsVisible,visible=false")
		end
	end
end

function GetSummonerSkillIsVisible(flag) 
	if n_summonerskill_ui ~= nil and n_summonerskill_ui:IsVisible() then
		return 1
	else
		return 0
	end
end