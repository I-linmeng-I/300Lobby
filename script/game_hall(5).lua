include("../Data/Script/Common/include.lua")
include("../Data/Script/Common/rotateGameHall.lua")
--123
-- local IsTodayFirstSignIn = 0      -----是否今日首次登陆
btn_taaa=nil
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
local saoleicount_bk = nil
local saoleicount_bkwenzi = nil
local bk_switch1 = nil
local saolei_BK = nil
saolei_BKWND =nil
local leiweizhi = {}
local saoleilock = false
saoleifangkuang = {}
jieguofangkuai = {}
jieguofangkuaiwenzi = {}
jieguofangkuaijiance = {}
qizifangkuai = {}
local shengyuleishuliang = 40
local setuqiehuan = 1
isplaying = false
local changebacktimer = nil
local account = nil
local uiedi1 = nil
local userinput1 = nil
local account2 = nil
local uiedi2 = nil
local userinput2 = nil
local bk_switch7 = nil
local playlistline = nil
local playlistname = {}
local playlistimagename = {}
local playlistimagenamename = {}
local patspeed_X = 0
local patspeed_Y = 0
local walking = 1
local songcheck = nil
local shenwei = 1
local status = 1
local time = 0
local lastX,lastY = 0,0
local xunhuan = false
local imgreturn = false
playlistimagenamenamename = {0,1,2,3,4}
nowplayingnamename = ""
local bk_switch1 = nil
local beijing_BKWND = nil

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

function saoleijiance(i,j)
	saoleifangkuang[i][j]:SetVisible(0)
	local leijishu = 0
	for x = i - 1,i + 1 do
		for y = j - 1,j + 1 do
			if y <= 16 and y > 0 and x > 0 and x <= 16 then
				if leijiance(x,y) == true then
					if x == i and y == j then
						jieguofangkuai[x][y].changeimage(path.."explosive.BMP")  --../data/Minesweeper/explosive.BMP
						jieguofangkuaiwenzi[x][y]:SetFontText("",0x00EC00)
						saoleilock = true--修改false 不会输
						youwin.changeimage(path.."lose.BMP") --../data/Minesweeper/lose.BMP
						youwin:SetVisible(1)
						return
					else
						leijishu = leijishu + 1
					end
				end
			end
		end
	end
	if leijishu >= 1 then
		jieguofangkuaijiance[i][j] = 1
		jieguofangkuaiwenzi[i][j]:SetFontText(leijishu,0x00EC00)
	end
	if leijishu == 0 and jieguofangkuaijiance[i][j] ~= 2 then
		jieguofangkuaiwenzi[i][j]:SetFontText("",0x00EC00)
		jieguofangkuaijiance[i][j] = 2
		for  a = i-1,i+1 do
			for  b = j-1,j+1 do
				if a <= 16 and a > 0 and b > 0 and b <= 16 then
					saoleijiance(a,b)
				end
			end
		end
	end
end


function leijiance(i,j)
	for c,v in ipairs(leiweizhi) do
		if (j-1) * 16 + i == v then
			return true
		end
	end
	return false
end

function saolei()
	--初始化
	for i=1,16 do
		for j=1,16 do
			jieguofangkuaijiance[i][j] = 0
			jieguofangkuai[i][j].changeimage(path.."aaa.BMP")--"../data/Minesweeper/aaa.BMP"
			jieguofangkuaiwenzi[i][j]:SetFontText("s",0x00EC00)
			saoleifangkuang[i][j]:SetVisible(1)
			qizifangkuai[i][j]:SetVisible(0)
		end
	end
	--计算雷位置
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	leiweizhi = {}
	while #leiweizhi < 40 do 
		local istrue = false
		local leinum = math.random( 1,256 )
		if #leiweizhi ~= nil then
			for i = 1 ,#leiweizhi do
				if leiweizhi[i] == leinum then
					istrue = true
				end
			end
		end
		if istrue == false then
			table.insert( leiweizhi, leinum )
		end
	end
end



function InitMainGame_hall(wnd)

	--底图背景
	MainHall_BK = wnd:AddImage(path_MailHallSkin,0,0,1280,800)
	MainHall_Effect = wnd:AddEffect(Dynamic_BG,0,0,1280,800)
	local backgroundeffect = wnd:AddEffect("../Data/Magic/Common/UI/changwai/183Skin1/183Skin1_od.x",0,0,1280,800)
	btn_taaa = wnd:AddImage("../data/wallpaper/20.bmp",0,0,1280,800)
    --local bk_T = wnd:AddButton("../data/wallpaper/l.bmp","../data/wallpaper/l1.bmp","../data/wallpaper/l2.bmp",189,730-OffsetY1,69,70)
    --local time = 1
    --bk_T.script[XE_LBUP] = function()
     -- taaa.changeimage("../data/wallpaper/"..time..".bmp")
      --time=time+1
      --if time==20 then
      --time=1
    --end
	--end
	--MainHall_Effect:SetTouchEnabled(0)
	

	--音乐选单
	local pat = wnd:AddImage("musicplayer/img/shime1.png",534,637,128,128)
	local patbutton = wnd:AddButton("musicplayer/texture/aaa.png","musicplayer/texture/aaa.png","musicplayer/texture/aaa.png",534,637,128,128)
	local xx,yy = 534,637
	local moveable = false
	local isfling = -1
	local x,y = 0,0
    local xxx,yyy = 0,0
    local buttonpad = CreateWindow(wnd.id,662,440,400,33)
    buttonpad:SetVisible(0)
    local playlisttable = CreateWindow(buttonpad.id,0,0,478,389)
    local musicbutton = buttonpad:AddButton(path_lolcard.."btnBK.BMP",path_lolcard.."btnBK_2.BMP",path_lolcard.."btnBK_3.BMP",0,390,100,33)
    musicbutton:AddFont("音乐开关",15,8,0,0,100,33,0xffffff)
    local saoleibutton = buttonpad:AddButton(path_lolcard.."btnBK.BMP",path_lolcard.."btnBK_2.BMP",path_lolcard.."btnBK_3.BMP",110,390,100,33)
    saoleibutton:AddFont("扫雷开关",15,8,0,0,100,33,0xffffff)
    local beijingbutton = buttonpad:AddButton(path_lolcard.."btnBK.BMP",path_lolcard.."btnBK_2.BMP",path_lolcard.."btnBK_3.BMP",220,390,100,33)
    beijingbutton:AddFont("背景相关",15,8,0,0,100,33,0xffffff)
    musicbutton.script[XE_LBUP] = function()
        playlisttable:SetVisible(1)
        musicbutton:SetVisible(0)
        saoleibutton:SetVisible(0)
        beijingbutton:SetVisible(0)
    end
    saoleibutton.script[XE_LBUP] = function()
        saolei_BKWND:SetVisible(1)
        musicbutton:SetVisible(0)
        saoleibutton:SetVisible(0)
        beijingbutton:SetVisible(0)
    end	
    beijingbutton.script[XE_LBUP] = function()
        beijing_BKWND:SetVisible(1)
        musicbutton:SetVisible(0)
        saoleibutton:SetVisible(0)
        beijingbutton:SetVisible(0)
	end	
	patbutton.script[XE_LBUP] = function()
		if moveable == true then
			moveable = false
			xx = xx+x-xxx
			yy = yy+y-yyy
			isfling = 0
		end
	end
	patbutton.script[XE_RBUP] = function()
		if buttonpad:IsVisible() then
            buttonpad:SetVisible(0)
            playlisttable:SetVisible(0)
            saolei_BKWND:SetVisible(0)
            beijing_BKWND:SetVisible(0)
		else
            buttonpad:SetVisible(1)
            musicbutton:SetVisible(1)
            saoleibutton:SetVisible(1)
            beijingbutton:SetVisible(1)
		end
	end
	patbutton.script[XE_LBDOWN] = function()
		if moveable == false then
			patspeed_X = 0
			patspeed_Y = 0
			xxx,yyy = MainHall_BK:GetLocalMousePosition()
			moveable = true
			status = 1
		end
	end
	patbutton:ToggleBehaviour(XE_ONUPDATE, 1)
	patbutton:ToggleEvent(XE_ONUPDATE, 1)
	patbutton.script[XE_ONUPDATE] = function()
		if moveable == true then
			x,y = MainHall_BK:GetLocalMousePosition()
			if x < 0 or x > 1152 then
				x = lastX
			end
			if lastY-y > 1 then
				if patspeed_Y > -5 then
					patspeed_Y = patspeed_Y - 0.3
				end
			else
				patspeed_Y = 0
			end
			if x - lastX > 0.1 or x - lastX < -0.1  then
				if x - lastX > 5 then
					patspeed_X = 5
				elseif x - lastX < -5 then
					patspeed_X = -5
				else
					patspeed_X = x - lastX
				end
			else
				patspeed_X = 0
			end
			if patspeed_X > 1 then
				pat.changeimage("musicplayer/img/shime7.png")
			elseif x - lastX == 0 then
				if shenwei == 1 then
					pat.changeimage("musicplayer/img/shime25.png")
				elseif shenwei == 0 then
					pat.changeimage("musicplayer/img/shime1.png")
				end
			elseif patspeed_X < -1 then
				pat.changeimage("musicplayer/img/shime8.png")
			end
			patbutton:SetPosition(xx+x-xxx,yy+y-yyy)
			pat:SetPosition(xx+x-xxx,yy+y-yyy)
			buttonpad:SetPosition(xx+128+x-xxx,yy-297+y-yyy)
			lastX,lastY = MainHall_BK:GetLocalMousePosition()
		elseif yy < 637 or isfling == 0 then
			isfling = 1
			if patspeed_X < 0 then
				pat.changeimage("musicplayer/img/shime4.png")
				shenwei = 0
			elseif patspeed_X > 0 then
				pat.changeimage("musicplayer/img/shime28.png")
				shenwei = 1
			elseif shenwei == 1 then
				pat.changeimage("musicplayer/img/shime28.png")
			elseif shenwei ==0 then
				pat.changeimage("musicplayer/img/shime4.png")
			end
			xx = xx + patspeed_X
			if xx < 0 then
				xx = 0
				patspeed_X = 0
			elseif xx > 1152 then
				xx = 1152
				patspeed_X = 0
			end
			yy = yy + patspeed_Y
			patbutton:SetPosition(xx,yy)
			pat:SetPosition(xx,yy)
			buttonpad:SetPosition(xx+128,yy-297)
		elseif isfling == -1 then
			if status ==2 then
				xx = xx - 0.1
				patbutton:SetPosition(xx,yy)
				pat:SetPosition(xx,yy)
				buttonpad:SetPosition(xx+128,yy-297)
			elseif status == 3 then
				xx = xx + 0.1
				patbutton:SetPosition(xx,yy)
				pat:SetPosition(xx,yy)
				buttonpad:SetPosition(xx+128,yy-297)
			end
		end
	end
	playlisttable:SetVisible(0)
	os.execute([[json.exe start]])
	local musicbk = playlisttable:AddImage("musicplayer/texture/bk.png",0,0,478,389)
	local buttonbk = playlisttable:AddImage("musicplayer/texture/minibk.png",0,280,200,110)
	buttonbk:SetVisible(0)

	playlistline = CreateWindow(playlisttable.id,10,54,460,220)
	
	CreateplaylistHall()
	playlistline:EnableEvent(XE_MOUSEWHEEL)
	playlistline.script[XE_MOUSEWHEEL] = function()
		if #playlistname>5 then
			local updown  = XGetMsgParam0()
			if updown <0 then
				if playlistimagenamenamename[5]+1<#playlistname then
					for i=1,5 do
						playlistimagenamename[i]:SetFontText(playlistname[playlistimagenamenamename[i]+2],0x1C1C1C)
						playlistimagenamenamename[i]=playlistimagenamenamename[i]+1
						
					end
				end
			elseif updown > 0 then
				if playlistimagenamenamename[1]> 0 then
					for i=1,5 do
						playlistimagenamename[i]:SetFontText(playlistname[playlistimagenamenamename[i]],0x1C1C1C)
						playlistimagenamenamename[i]=playlistimagenamenamename[i]-1
						
					end
				end
			end
		end
	end
	playlistline:SetVisible(0)

	local aaa = playlisttable:AddImage("musicplayer/texture/aaa.png",34,325,200,50)
	local file = io.open("musicplayer/config/volume.txt",'r')
	local volumevolume = file:read('*all')
	file:close()
	local volume = aaa:AddFont(volumevolume,25,8,0,5,77,50,0x1C1C1C)

	local img_Id = playlisttable:AddImage("musicplayer/texture/account_login.png",123 - 117,50 - 44,232,36)
	account = img_Id:AddFont("歌单id",18,0,9,6,230,20,0xffffffff)
	uiedi1 = CreateWindow(playlisttable.id,198 - 117,57 - 44,100,57)
	userinput1 = uiedi1:AddEdit(path_login.."passwordEdit_login.BMP","","onEnterGame1","onLoginTab",18,0,0,90,30,0xffffffff,0xff000000,0,"onLBUP")
	userinput1:SetTransparent(0)
	XEditSetMaxByteLength(userinput1.id,100)
	--XEditInclude(userinput1.id,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_-.@")

	function onEnterGame1()
		os.execute([[json.exe playlist ]]..userinput1:GetEdit())
		CreateplaylistHall()
		userinput1:SetEdit("")
	end

	local img_Id2 = playlisttable:AddImage("musicplayer/texture/account_login.png",323 - 117,50 - 44,232,36)
	account2 = img_Id2:AddFont("歌曲id",18,0,9,6,430,20,0xffffffff)
	uiedi2 = CreateWindow(playlisttable.id,398 - 117,57 - 44,100,57)
	userinput2 = uiedi2:AddEdit(path_login.."passwordEdit_login.BMP","","onEnterGame2","onLoginTab",18,0,0,90,30,0xffffffff,0xff000000,0,"onLBUP")
	userinput2:SetTransparent(0)
	XEditSetMaxByteLength(userinput2.id,100)
	--XEditInclude(userinput1.id,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_-.@")

	function onEnterGame2()
		os.execute([[json.exe song ]]..userinput2:GetEdit())
		CreateplaylistHall()
		userinput2:SetEdit("")
	end

	math.randomseed(tostring(os.time()):reverse():sub(1, 7))

	local nowplaying = playlisttable:AddImage("musicplayer/texture/aaa.png",3,285,194,44)
	local nowplayingname = nowplaying:AddFont("",18,8,0,0,194,44,0x1C1C1C)
	local file = io.open("musicplayer/config/currentsongnameid.txt",'a')
	file:close()
	patbutton:SetTimer(songcheck, 100).Timer = function(timer, interval)
		local file = io.open("musicplayer/config/currentsongid.txt",'r')
		nowplayingnamename = file:read('*all')
		file:close()
		if nowplayingnamename ~= "" then
			nowplayingname:SetFontText(string.match(nowplayingnamename, '(.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?).*$'),0x1C1C1C)
		end
		if moveable == false and isfling ~= 0 then
			if (yy >= 637) and (isfling == 1)then
				if xx > 746 and imgreturn == false then
					status = 2
					walking = 0
					imgreturn = true
				end
				if shenwei == 0 then
					pat.changeimage("musicplayer/img/shime23.png")
				elseif shenwei == 1 then
					pat.changeimage("musicplayer/img/shime19.png")
				end
				isfling = 2
				yy = 637
				patspeed_X = 0
				patspeed_Y = 0
				patbutton:SetPosition(xx,yy)
				pat:SetPosition(xx,yy)
				buttonpad:SetPosition(xx+128,yy-297)
			elseif (yy >= 637) and (isfling == 2)then
				pat.changeimage("musicplayer/img/shime5.png")
				isfling = 3
			elseif (yy >= 637) and (isfling == 3)then
				if shenwei == 0 then
					pat.changeimage("musicplayer/img/shime1.png")
				elseif shenwei == 1 then
					pat.changeimage("musicplayer/img/shime25.png")
				end
				isfling = -1
			end
		end
		if isfling == 1 then
			if patspeed_Y < 3 then
				if moveable ~= true then
					patspeed_Y = patspeed_Y + 1
				end
			end
		end
		if status == 2 then
			walking = walking + 1
			if walking == 4 then
				walking = 1
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
		end
		if status == 3 then
			walking = walking + 1
			if walking == 28 then
				walking = 25
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
		end
		if status == 4 then
			walking = walking + 1
			if walking == 22 then
				walking = 19
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
			xx = xx + 2
			patbutton:SetPosition(xx,yy)
			pat:SetPosition(xx,yy)
			buttonpad:SetPosition(xx+128,yy-297)
		end
		if status == 5 then
			walking = walking + 1
			if walking == 25 then
				walking = 22
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
			xx = xx - 2
			patbutton:SetPosition(xx,yy)
			pat:SetPosition(xx,yy)
			buttonpad:SetPosition(xx+128,yy-297)
		end
		if status == 6 then
			walking = walking + 1
			if walking == 15 then
				status = 0
				walking = 11
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
		end
		if status == 7 then
			walking = walking + 1
			if walking == 34 and xunhuan == false then
				xunhuan = true
				walking =33
			end
			pat.changeimage("musicplayer/img/shime"..walking..".png")
			if xunhuan == true then
				walking = walking - 2
				if walking == 28 then
					status = 0	
					xunhuan = false
					pat.changeimage("musicplayer/img/shime11.png")
				end
			end
			
		end
		if walking ~= 0 and moveable == false and isfling == -1 and imgreturn == false and (xx < 150 or xx > 730 )then
			if shenwei == 0 then
				pat.changeimage("musicplayer/img/shime1.png")
			elseif shenwei == 1 then
				pat.changeimage("musicplayer/img/shime25.png")
			end
			walking = 0
			status = 1
			if xx > 730 then
				xx = 730
				patbutton:SetPosition(xx,yy)
				pat:SetPosition(xx,yy)
				buttonpad:SetPosition(xx+128,yy-297)
			elseif xx < 150 then
				xx =150
				patbutton:SetPosition(xx,yy)
				pat:SetPosition(xx,yy)
				buttonpad:SetPosition(xx+128,yy-297)
			end
		end
		if imgreturn == true and xx < 746 then
			shenwei = 0
			imgreturn = false
			if shenwei == 0 then
				pat.changeimage("musicplayer/img/shime1.png")
			elseif shenwei == 1 then
				pat.changeimage("musicplayer/img/shime25.png")
			end
			walking = 0
			status = 1
		end
		time = time + 1
		if time >= 200 or time == 100 then
			if moveable == false and isfling == -1 and imgreturn == false and time >= 200 then
				local num = math.random(2)
				if num == 1 then
					if shenwei == 0 then
						pat.changeimage("musicplayer/img/shime1.png")
					elseif shenwei == 1 then
						pat.changeimage("musicplayer/img/shime25.png")
					end
					status = 1
				else
					pat.changeimage("musicplayer/img/shime11.png")
					status = 0
				end
				time = 0
			end
			if moveable == false and isfling == -1 and imgreturn == false and (status == 1 or status == 2 or status == 3 or status == 4 or status == 5) then
				num = math.random(3)
				if num == 1 then
					if shenwei == 0 then
						pat.changeimage("musicplayer/img/shime1.png")
					elseif shenwei == 1 then
						pat.changeimage("musicplayer/img/shime25.png")
					end
					status = 1
				elseif num == 2 then
					if xx > 500 then
						status = 2
						walking = 1
						shenwei = 0
					else
						status = 3
						walking = 25
						shenwei = 1
					end
				elseif num == 3 then
					if xx > 500 then
						status = 4
						walking = 18
						shenwei = 0
					else
						status = 5
						walking = 21
						shenwei = 1
					end
				end
			end
			if moveable == false and isfling == -1 and imgreturn == false and (status == 0 or status == 6 or status == 7) then
				num = math.random(3)
				if num == 1 then
					pat.changeimage("musicplayer/img/shime11.png")
					status = 0
				elseif num == 2 then
					status = 6
					walking = 11
				elseif num == 3 then
					status = 7
					walking = 29
				end
			end
		end
	end

	local bk_switch3 = playlisttable:AddButton("musicplayer/texture/stop1.png","musicplayer/texture/stop2.png","musicplayer/texture/stop3.png",53,360,36,23)
	bk_switch3.script[XE_LBUP] = function()
		if isplaying == true then
			XClickPlaySound(UI_click_new)
			local file = io.open("musicplayer/pause.txt",'w')
	    	file:close()
		end
	end
	local bk_switch4 = playlisttable:AddButton("musicplayer/texture/last1.png","musicplayer/texture/last2.png","musicplayer/texture/last3.png",3+5,360,36,23)
	bk_switch4.script[XE_LBUP] = function()
		if isplaying == true then
			XClickPlaySound(UI_click_new)
			local file = io.open("musicplayer/last.txt",'w')
	    	file:close()
		end
	end
	local bk_switch5 = playlisttable:AddButton("musicplayer/texture/next1.png","musicplayer/texture/next2.png","musicplayer/texture/next3.png",100+5,360,36,23)
	bk_switch5.script[XE_LBUP] = function()
		if isplaying == true then
			XClickPlaySound(UI_click_new)
			local file = io.open("musicplayer/next.txt",'w')
			file:close()
		end
	end
	local bk_switch8 = playlisttable:AddButton("musicplayer/texture/VolumeDown1.png","musicplayer/texture/VolumeDown2.png","musicplayer/texture/VolumeDown3.png",3+5,328,36,23)
	bk_switch8.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if isplaying == true then
			if volumevolume - 10 >= 0 then
				local file = io.open("musicplayer/config/volume.txt",'r')
				volumevolume = file:read('*all')
				file:close()
				local file = io.open("musicplayer/sub.txt",'w')
				volumevolume = volumevolume-10
				volume:SetFontText(volumevolume,0x1C1C1C)
				file:close()
			end
		end
	end
	local bk_switch9 = playlisttable:AddButton("musicplayer/texture/VolumeUp1.png","musicplayer/texture/VolumeUp2.png","musicplayer/texture/VolumeUp3.png",103,328,36,23)
	bk_switch9.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		if isplaying == true then
			if volumevolume + 10 <= 100 then
				local file = io.open("musicplayer/config/volume.txt",'r')
				volumevolume = file:read('*all')
				file:close()
				local file = io.open("musicplayer/add.txt",'w')
				volumevolume = volumevolume+10
				volume:SetFontText(volumevolume,0x1C1C1C)
				file:close()
			end
		end
	end

	local bk_switch10 = playlisttable:AddButton("musicplayer/texture/single.png","musicplayer/texture/single.png","musicplayer/texture/single.png",153,328,36,23)
	local bk_switch11 = playlisttable:AddButton("musicplayer/texture/ramdom.png","musicplayer/texture/ramdom.png","musicplayer/texture/ramdom.png",153,328,36,23)
	local bk_switch12 = playlisttable:AddButton("musicplayer/texture/rotate.png","musicplayer/texture/rotate.png","musicplayer/texture/rotate.png",153,328,36,23)
	bk_switch10.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		local file = io.open("musicplayer/config/style.txt",'w')
		file:write("3")
		file:close()
		bk_switch11:SetVisible(1)
		bk_switch10:SetVisible(0)
	end
	bk_switch11.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		local file = io.open("musicplayer/config/style.txt",'w')
		file:write("1")
		file:close()
		bk_switch12:SetVisible(1)
		bk_switch11:SetVisible(0)
	end
	bk_switch12.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		local file = io.open("musicplayer/config/style.txt",'w')
		file:write("2")
		file:close()
		bk_switch10:SetVisible(1)
		bk_switch12:SetVisible(0)
	end

	local bk_switch6 = playlisttable:AddButton("musicplayer/texture/close1.png","musicplayer/texture/close2.png","musicplayer/texture/close3.png",423+20,50-39,24,24)
	bk_switch6.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		bk_switch6:SetVisible(0)
		musicbk:SetVisible(0)
		img_Id:SetVisible(0)
		img_Id2:SetVisible(0)
		uiedi1:SetVisible(0)
		uiedi2:SetVisible(0)
		buttonbk:SetVisible(1)
		bk_switch7:SetVisible(1)
		playlistline:SetVisible(0)
	end

	bk_switch7 = playlisttable:AddButton("musicplayer/texture/maxim1.png","musicplayer/texture/maxim2.png","musicplayer/texture/maxim3.png",163,360,23,23)
	bk_switch7.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
		bk_switch6:SetVisible(1)
		musicbk:SetVisible(1)
		img_Id:SetVisible(1)
		img_Id2:SetVisible(1)
		uiedi1:SetVisible(1)
		uiedi2:SetVisible(1)
		buttonbk:SetVisible(0)
		bk_switch7:SetVisible(0)
		playlistline:SetVisible(1)
	end

	local file = io.open("musicplayer/config/style.txt",'r')
	nowplayingnamename = file:read('*all')
	file:close()
	if nowplayingnamename == "1" then
		bk_switch11:SetVisible(0)
		bk_switch10:SetVisible(0)
	end
	if nowplayingnamename == "2" then
		bk_switch11:SetVisible(0)
		bk_switch12:SetVisible(0)
	end
	if nowplayingnamename == "3" then
		bk_switch10:SetVisible(0)
		bk_switch12:SetVisible(0)
	end
	nowplayingnamename = ""
	bk_switch6:SetVisible(0)
	musicbk:SetVisible(0)
	img_Id:SetVisible(0)
	img_Id2:SetVisible(0)
	uiedi1:SetVisible(0)
	uiedi2:SetVisible(0)
	buttonbk:SetVisible(1)	
	--音乐选单结束
    
    --扫雷开始
    saolei_BKWND = CreateWindow(buttonpad.id, 0, -155, 544, 544)--背景
    saolei_BKWND:SetVisible(0)
	saolei_BK = saolei_BKWND:AddImage("mine/setu1.bmp",0,0,544,544)--"../data/Minesweeper/bk.BMP"
	saoleicount_bk = saolei_BKWND:AddImage("mine/countbk.BMP",0,544,140,34)--"../data/Minesweeper/countbk.BMP"
	saoleicount_bkwenzi = saoleicount_bk:AddFont("剩余雷数量："..shengyuleishuliang,25,8,0,0,140,34,0xFF0000)
	--创建方块
	for i=1,16 do
		saoleifangkuang[i] = {}
		qizifangkuai[i] = {}
		jieguofangkuai[i] = {}
		jieguofangkuaiwenzi[i] = {}
		jieguofangkuaijiance[i] = {}
		for j=1,16 do
			jieguofangkuaijiance[i][j] = 0
			jieguofangkuai[i][j] = saolei_BKWND:AddImage("mine/aaa.BMP",34*(i-1),34*(j-1), 34, 34)--"../data/Minesweeper/aaa.BMP"
			jieguofangkuaiwenzi[i][j] = jieguofangkuai[i][j]:AddFont("",30,8,0,0,34,34,0x1C1C1C)
			saoleifangkuang[i][j] = saolei_BKWND:AddButton("mine/gezi1.BMP", "mine/gezi2.BMP", "mine/gezi3.BMP",34*(i-1),34*(j-1), 34, 34)
			qizifangkuai[i][j] = saolei_BKWND:AddButton("mine/flag.BMP", "mine/flag.BMP","mine/flag.BMP",34*(i-1),34*(j-1), 34, 34)--"../data/Minesweeper/flag.BMP", "../data/Minesweeper/flag.BMP", "../data/Minesweeper/flag.BMP"
			saoleifangkuang[i][j].script[XE_LBUP] = function()
				if saoleilock == false then
					saoleijiance(i,j)
					for c= 1,16 do
						for d=1,16 do
							if jieguofangkuaijiance[c][d] == 2 then
								saoleijiance(c,d)
							end
						end
					end
					if saoleilock == false then
						local leicount = 0
						for c= 1,16 do
							for d=1,16 do
								if jieguofangkuaijiance[c][d] == 0 then
									leicount = leicount +1
								end
							end
						end
						if leicount == 40 then
							if setuqiehuan == 10 then
								setuqiehuan = 0
							end
							setuqiehuan = setuqiehuan + 1
							saolei_BK.changeimage(path.."setu"..setuqiehuan..".bmp")--路径""setu1.bmp"改数字
							youwin:SetVisible(1)
							saoleilock = true
							for i =1,16 do
								for j=1,16 do
									jieguofangkuaiwenzi[i][j]:SetFontText("",0x00EC00)
									qizifangkuai[i][j]:SetVisible(0)
									saoleifangkuang[i][j]:SetVisible(0)
								end
							end
						end
					end
				end
			end
			saoleifangkuang[i][j].script[XE_RBUP] = function()
				if saoleilock == false then
					qizifangkuai[i][j]:SetVisible(1)
					shengyuleishuliang = shengyuleishuliang - 1
					saoleicount_bkwenzi:SetFontText("剩余雷数量："..shengyuleishuliang,0xFF0000)
				end
			end
			qizifangkuai[i][j].script[XE_RBUP] = function()
				if saoleilock == false then
					qizifangkuai[i][j]:SetVisible(0)
					shengyuleishuliang = shengyuleishuliang + 1
					saoleicount_bkwenzi:SetFontText("剩余雷数量："..shengyuleishuliang,0xFF0000)
				end
			end
		end
	end
	youwin = saolei_BKWND:AddImage("mine/win.BMP",0,0,544,544)--"../data/Minesweeper/win.BMP"
	youwin:SetVisible(0)
	saolei()--初始化
	local chushihua = saolei_BKWND:AddButton("mine/gezi1.BMP","mine/gezi2.BMP","mine/gezi3.BMP",139,544, 40, 34)
	local reset = chushihua:AddFont("重置",25,8,0,0,40,34,0xFF0000)
	chushihua.script[XE_LBUP] = function()
		saolei()
		saoleilock = false
		youwin:SetVisible(0)
		youwin.changeimage("mine/win.BMP")--"../data/Minesweeper/win.BMP"
		shengyuleishuliang = 40
	end

	saolei_BKWND:SetVisible(0)
	--扫雷结束

    --背景切换开始
    beijing_BKWND = CreateWindow(buttonpad.id,0,150,409,233)
    beijing_BKWND:SetVisible(0)
    local beijing_bk = beijing_BKWND:AddImage(path.."txbk.BMP",0,-121,628,406)--背景
	beijing_bk:AddFont("背景切换&特效控制",15,8,-214,-21,200,33,0xffffff)
	
    local liuguang = beijing_BKWND:AddImage(path.."checkbox_login.BMP",43,-55,24,24)
    liuguang:SetTouchEnabled(1)
    local liuguangdianji = liuguang:AddImage(path.."checkboxhave_login.BMP",0,0,24,24)
    liuguangdianji:SetTouchEnabled(0)
    liuguang:AddFont("流光特效",15,0,24,0,500,20,0xffffff)
	
	local yinghuashu = beijing_BKWND:AddImage(path.."checkbox_login.BMP",143,-55,24,24)
    yinghuashu:SetTouchEnabled(1)
    local yinghuashudianji = yinghuashu:AddImage(path.."checkboxhave_login.BMP",0,0,24,24)
    yinghuashudianji:SetTouchEnabled(0)
    yinghuashu:AddFont("樱花特效",15,0,24,0,500,20,0xffffff)
	
    local luoxue = beijing_BKWND:AddImage(path.."checkbox_login.BMP",243,-55,24,24)
    luoxue:SetTouchEnabled(1)
    local luoxuedianji = luoxue:AddImage(path.."checkboxhave_login.BMP",0,0,24,24)
    luoxuedianji:SetTouchEnabled(0)
    luoxue:AddFont("落雪特效",15,0,24,0,500,20,0xffffff)
	
	local yudi = beijing_BKWND:AddImage(path.."checkbox_login.BMP",343,-55,24,24)
    yudi:SetTouchEnabled(1)
    local yudidianji = yudi:AddImage(path.."checkboxhave_login.BMP",0,0,24,24)
    yudidianji:SetTouchEnabled(0)
    yudi:AddFont("雨滴特效",15,0,24,0,500,20,0xffffff)
	
	local pianyi = beijing_BKWND:AddImage(path.."checkbox_login.BMP",443,-55,24,24)
    pianyi:SetTouchEnabled(1)
    local pianyidianji = pianyi:AddImage(path.."checkboxhave_login.BMP",0,0,24,24)
    pianyidianji:SetTouchEnabled(0)
    pianyi:AddFont("鼠标偏移",15,0,24,0,500,20,0xffffff)
	
	liuguang.script[XE_LBUP] = function()
		if liuguangdianji:IsVisible() then
			liuguangdianji:SetVisible(0)
			backgroundeffect:SetVisible(0)
		else
			liuguangdianji:SetVisible(1)
			yinghuashudianji:SetVisible(0)
			luoxuedianji:SetVisible(0)
			yudidianji:SetVisible(0)
			pianyidianji:SetVisible(0)
			backgroundeffect:SetVisible(1)
			backgroundeffect:ChangeEffect("../Data/Magic/Common/UI/changwai/183Skin1/183Skin1_od.x")
		end
	end

	yinghuashu.script[XE_LBUP] = function()
		if liuguangdianji:IsVisible() then
			yinghuashudianji:SetVisible(0)
			backgroundeffect:SetVisible(0)
		else
			liuguangdianji:SetVisible(0)
			yinghuashudianji:SetVisible(1)
			luoxuedianji:SetVisible(0)
			yudidianji:SetVisible(0)
			pianyidianji:SetVisible(0)
			backgroundeffect:SetVisible(1)
		end
	end

	luoxue.script[XE_LBUP] = function()
		if liuguangdianji:IsVisible() then
			luoxuedianji:SetVisible(0)
			backgroundeffect:SetVisible(0)
		else
			liuguangdianji:SetVisible(0)
			yinghuashudianji:SetVisible(0)
			luoxuedianji:SetVisible(1)
			yudidianji:SetVisible(0)
			pianyidianji:SetVisible(0)
			backgroundeffect:SetVisible(1)
		end
	end

	yudi.script[XE_LBUP] = function()
		if liuguangdianji:IsVisible() then
			yudidianji:SetVisible(0)
			backgroundeffect:SetVisible(0)
		else
			liuguangdianji:SetVisible(0)
			yinghuashudianji:SetVisible(0)
			luoxuedianji:SetVisible(0)
			yudidianji:SetVisible(1)
			pianyidianji:SetVisible(0)
			backgroundeffect:SetVisible(1)
		end
	end

	pianyi.script[XE_LBUP] = function()
		if liuguangdianji:IsVisible() then
			pianyidianji:SetVisible(0)
			backgroundeffect:SetVisible(0)
		else
			liuguangdianji:SetVisible(0)
			yinghuashudianji:SetVisible(0)
			luoxuedianji:SetVisible(0)
			yudidianji:SetVisible(0)
			pianyidianji:SetVisible(1)
			backgroundeffect:SetVisible(1)
		end
	end
    
	local shipinbutton = beijing_BKWND:AddButton(path.."bt.BMP",path.."bt2.BMP",path.."bt3.BMP",143,-15,87,20)

	yinghuashudianji:SetVisible(0)
	luoxuedianji:SetVisible(0)
	yudidianji:SetVisible(0)
	pianyidianji:SetVisible(0)

    --背景切换结束
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

function CreateplaylistHall()
	local file = io.open("musicplayer/config/playlistname.txt",'a')
	file:close()
	local file = io.open("musicplayer/config/playlistname.txt",'r')
	if file:read('*all') ~= "" then
		local i = 1
		if #playlistname == 0 then
			local file = io.open("musicplayer/config/playlistname.txt",'r')
		    for line in file:lines() do
			    table.insert(playlistname, line)
			    table.insert(playlistimagename, nil)
				table.insert(playlistimagenamename, nil)
			end
			file:close()
		    local hight = 0
		    while(i <= 5) do
				playlistimagename[i] = playlistline:AddButton("musicplayer/texture/songbk.png","musicplayer/texture/songbk.png","musicplayer/texture/songbk.png",0,hight,460,44)
				if i == 1 then
					playlistimagename[i].script[XE_LBUP] = function()
						XClickPlaySound(UI_click_new)
						local file = io.open("musicplayer/start.txt",'w')
						file:write(playlistimagenamenamename[1])
						isplaying = true
						file:close()
					end
				elseif i == 2 then
					playlistimagename[i].script[XE_LBUP] = function()
						XClickPlaySound(UI_click_new)
						local file = io.open("musicplayer/start.txt",'w')
						file:write(playlistimagenamenamename[2])
						isplaying = true
						file:close()
					end
				elseif i == 3 then
					playlistimagename[i].script[XE_LBUP] = function()
						XClickPlaySound(UI_click_new)
						local file = io.open("musicplayer/start.txt",'w')
						file:write(playlistimagenamenamename[3])
						isplaying = true
						file:close()
					end
				elseif i == 4 then
					playlistimagename[i].script[XE_LBUP] = function()
						XClickPlaySound(UI_click_new)
						local file = io.open("musicplayer/start.txt",'w')
						file:write(playlistimagenamenamename[4])
						isplaying = true
						file:close()
					end
				elseif i == 5 then
					playlistimagename[i].script[XE_LBUP] = function()
						XClickPlaySound(UI_click_new)
						local file = io.open("musicplayer/start.txt",'w')
						file:write(playlistimagenamenamename[5])
						isplaying = true
						file:close()
					end
				end
				playlistimagenamename[i] = playlistimagename[i]:AddFont("",40,0,9,10,460,40,0x1C1C1C)
				hight = hight + 44
				if i > #playlistname then
					playlistimagename[i]:SetVisible(0)
				end
			    i = i + 1
		    end
		else
			local linenumber = 0
			local file = io.open("musicplayer/config/playlistname.txt",'r')
		    for line in file:lines() do
			    linenumber = linenumber + 1
			end
			file:close()
			if #playlistname>linenumber then
				if linenumber<5 then
					for a= linenumber + 1, #playlistname do 
						playlistimagename[a]:SetVisible(0)
						if a == 5 then
							break
						end
					end 
				end
			end
			if #playlistname < 5 then
				if #playlistname<linenumber then
					for a=#playlistname+1,linenumber do
						playlistimagename[a]:SetVisible(1)
						if a == 5 then
							break
						end
					end 
				end
			end
		end
	end	
	file:close()
	playlistname={}
	local file = io.open("musicplayer/config/playlistname.txt",'r')
	for line in file:lines() do
		table.insert(playlistname, line)
	end
	file:close()
	for a=1,#playlistname do
		playlistimagenamename[a]:SetFontText(string.match(playlistname[a], '(.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?.?).*$'),0x1C1C1C)
		if a == 5 then
			break
		end
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