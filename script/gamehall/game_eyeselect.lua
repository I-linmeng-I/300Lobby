include("../Data/Script/Common/include.lua")

--消息界面
local btn_close = nil
local assist_icon = {}
local assist_Pic = {}
local assist_side = {}
local assist_name = {}
local Eye_iD = {}
local Eye_PicPath = {}
local Eye_tip = {}
local Eye_Name = {}
local back = nil

local BackRect = {472,333}


local EyeSelect_ui = nil
local scissorwnd,scissorwndBG = nil
--滚动条
local scissor_toggleImg = nil
local scissor_togglebtn = nil
local DownMany = 0
local MAXEYE = 30

function InitEyeSelect_ui(wnd,bisopen)
	n_eyeSelect_ui = CreateWindow(wnd.id, 885, 361, 378, 266)
	n_eyeSelect_ui:EnableBlackBackgroundTop(1)
	InitEyeSelect(n_eyeSelect_ui)
	n_eyeSelect_ui:SetVisible(bisopen)
end

function InitEyeSelect(wnd)
	back = wnd:AddImage(path_lolhero.."BK1_start.BMP",-861,150,378, 266)
	back:AddFont("眼皮肤",18,0,154,15,100,20,0xceaf61)
	back:AddImage(path_lolhero.."line.BMP",0,37,378,1)
		
	btn_close = back:AddButton(path_lolcommon.."close1.BMP",path_lolcommon.."close2.BMP",path_lolcommon.."close3.BMP",367,1,20,20)
	btn_close.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		
	    SetEyeSelectIsVisible(0)
	end
	
	EyeSelect_ui = CreateWindow(back.id, 0, 0, 378, 266)
	scissorwnd = CreateWindow(EyeSelect_ui.id, 0, 0, 378, 266)
	scissorwnd:SetTouchEnabled(1)
	scissorwnd:SetWindowScissorRect(30, 62, 330, 193)
	scissorwndBG = CreateWindow(scissorwnd.id, 0, 0, 330, 193)
	for i=1,MAXEYE do
		local posx = 67*((i-1)%5+1)-35
		local posy = 67*math.ceil(i/5)-3
		
		assist_icon[i] = scissorwndBG:AddImage(path_equip.."bag_equip.BMP",posx,posy,48,48)--底
		assist_Pic[i] = assist_icon[i]:AddImage(path_equip.."bag_equip.BMP",0,0,48,48)--图
		assist_side[i] = assist_icon[i]:AddImage(path_lolhero.."summonerSide_start.BMP",-2,-2,52,52)--框
		assist_side[i]:SetTouchEnabled(0)

		assist_Pic[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_click_new)
			
			XLwantChangeMyCurEyeSkin(Eye_iD[i])
			SetEyeSelectIsVisible(0)
		end
	end
	
	-- 显示滚动条
	scissor_toggleImg = back:AddImage(path_lolhero.."toggleBK_main.BMP",364,66,1,180)
	scissor_togglebtn = scissor_toggleImg:AddButton(path_lolhero.."toggleBTN1_main.BMP",path_lolhero.."toggleBTN2_main.BMP",path_lolhero.."toggleBTN3_main.BMP",-2,0,5,140)
	local ToggleT = scissor_toggleImg:AddImage(path_lolhero.."TD1_main.BMP",-3,-9,7,9)
	local ToggleD = scissor_toggleImg:AddImage(path_lolhero.."TD2_main.BMP",-3,180,7,9)
	
	XSetWindowFlag(scissor_togglebtn.id,1,1,0,40)
	
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
			local distanc = T/40*(67*math.ceil(#Eye_iD/5)-67)
			
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
	back:EnableEvent(XE_MOUSEWHEEL)
	back.script[XE_MOUSEWHEEL] = function()
		if n_eyeSelect_ui:IsVisible() == false then
			return
		end
		if #Eye_iD<=15 then
			return
		end
		local move = 67*math.ceil(#Eye_iD/5)-67
		
		local updownMove = 0
		local updown = XGetMsgParam0()
		if updown>0 then
			updownMove = -1*math.ceil(40/20)
		else
			updownMove = math.ceil(40/20)
		end
		
		local btn_pos = scissor_togglebtn._T + updownMove
		if btn_pos < 0 then
			btn_pos = 0
		end
		if btn_pos >40 then
			btn_pos = 40
		end		
		DownMany = btn_pos
		scissor_togglebtn:SetPosition(-2,btn_pos)
		scissor_togglebtn._T = btn_pos
		
		local distanc = (btn_pos*move)/40
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

function SetEyeInfo(picPath,ID,tip,name,index)
	Eye_iD[index] = ID
	Eye_PicPath[index] = picPath
	Eye_tip[index] = tip
	Eye_Name[index] = name
	
	if index <=15  then
		scissor_toggleImg:SetVisible(0)
	else
		scissor_toggleImg:SetVisible(1)
	end
	
	if index<=MAXEYE then
		assist_Pic[index].changeimage(Eye_PicPath[index])
		assist_Pic[index]:SetImageTip(Eye_tip[index])
		assist_icon[index]:SetVisible(1)
	end
end


function ClearEyeInfo()
	Eye_iD = {}
	Eye_PicPath = {}
	Eye_tip ={}
	Eye_Name = {}

	DownMany = 0
	scissorwndBG:SetPosition(0,0)
	scissor_togglebtn:SetPosition(-2,0)
	scissor_togglebtn._T = 0
	
	for i,v in pairs(assist_icon) do
		assist_icon[i]:SetVisible(0)
	end
end

function SetEyeSelectIsVisible(flag) 
	if n_eyeSelect_ui ~= nil then
		if flag == 1 and n_eyeSelect_ui:IsVisible() == false then
			n_eyeSelect_ui:CreateResource()
			n_eyeSelect_ui:SetVisible(1)
		elseif flag == 0 and n_eyeSelect_ui:IsVisible() == true then
			n_eyeSelect_ui:SetVisible(0)
			n_eyeSelect_ui:DeleteResource()
		end
	end
end