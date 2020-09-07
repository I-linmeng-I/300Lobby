include("../Data/Script/Common/include.lua")

-- member
local login_bg = nil
local select_server_bg = nil
local server_icon = nil
local cur_server_name = nil
local cur_server_ping = nil
local enter_game_btn = nil
local account_input = nil
local password_input = nil
local last_choose = {}	-- 最近登陆
last_choose.name = {}
last_choose.state = {}
last_choose.role = {}
last_choose.new = {}
local dianxin_choose = {}	-- 电信
dianxin_choose.name = {}
dianxin_choose.state = {}
dianxin_choose.role = {}
dianxin_choose.new = {}
local wangtong_choose = {}	-- 网通
wangtong_choose.name = {}
wangtong_choose.state = {}
wangtong_choose.role = {}
wangtong_choose.new = {}
local qx_choose = nil	-- 抢先
local qx_choose_name = nil
local account_list_bg = nil
local account_list = {}
account_list.text = {}
local rember_icon = nil
local password_bg = nil
local rember_bg = nil
local account_bg = nil
local qr_code = nil
local dx_scroll_btn = nil
local wt_scroll_btn = nil
local wangba_enter_btn = {}
local qiangxian_img = nil
local lobby_bg = nil
local lobby_list_icon = {}
local lobby_btn = nil
local lobby_arrow = nil
local zczh_btn = nil
local wjmm_btn = nil
local features_btn = {}
local qr_code_btn = nil
local wangba_btn = nil

-- data
local server_list_dx = {}
server_list_dx.index = {}
server_list_dx.name = {}
server_list_dx.path = {}
server_list_dx.ping = {}
local cur_index_dx = 1

local server_list_wt = {}
server_list_wt.index = {}
server_list_wt.name = {}
server_list_wt.path = {}
server_list_wt.ping = {}
local cur_index_wt = 1

local last_server_list = {}
last_server_list.index = {}
last_server_list.name = {}
last_server_list.path = {}
last_server_list.ping = {}

local only_choose_list = {}
local server_role_data = ""

local lobby_list = {}
lobby_list.path = {}
lobby_list.link = {}

local IsLock = 0
local DownList_Str_Info = {}
local CurServerType = 0

-- define
local LAST_MAX_COUNT = 2	-- 最近登陆最大个数
local DIANXIN_MAX_COUNT = 16	-- 电信登陆最大个数
local WANGTONG_MAX_COUNT = 8	-- 网通登陆最大个数
local ACCOUNT_LIST_MAX_COUNT = 5	-- 账号下拉列表显示的最大个数
local LOBBY_MAX_COUNT = 5	-- 广告最大个数

-- init
function InitLoginWnd(wnd, b)
	g_login_wnd = CreateWindow(wnd.id, 0, 0, 1280, 800)
	InitLoginUI(g_login_wnd)
	g_login_wnd:SetVisible(b)
end

-- init ui
function InitLoginUI(wnd)
	-- 登陆界面
	login_bg = wnd:AddImage(path_new_login.."lsbg.BMP", 0, 0, 1280, 800)
	login_bg:AddImage(path_new_login.."bg.BMP", 0, 0, 1280, 800)

	-- 最小化
	local minimize_btn = login_bg:AddButton(path_new_login.."minimize1.BMP", path_new_login.."minimize2.BMP", path_new_login.."minimize3.BMP", 1223, 7, 28, 28)
	minimize_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XGameSmallWindow()
	end
	
	-- 关闭
	local close_btn = login_bg:AddButton(path_new_login.."close1.BMP", path_new_login.."close2.BMP", path_new_login.."close3.BMP", 1246, 7, 28, 28)
	close_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XGameCloseWindow()
	end
	
	-- 选区界面
	select_server_bg = login_bg:AddImage(path_new_login.."SelectServer/bg.BMP", 2, 2, 1060, 738)
	
	-- 最近登陆
	local last_icon = select_server_bg:AddImage(path_new_login.."SelectServer/zjdl.BMP", 30, 100, 68, 16)
	for i = 1, LAST_MAX_COUNT do
		last_choose[i] = last_icon:AddButton(path_new_login.."SelectServer/server1.BMP", path_new_login.."SelectServer/server2.BMP", path_new_login.."SelectServer/server1.BMP", 10+(i-1)*172, 15, 149, 50)
		last_choose.name[i] = last_choose[i]:AddFont("", 14, 8, 0, 0, 149, 50, 0xffe2d3aa)
		last_choose.state[i] = last_choose[i]:AddImage(path_new_login.."SelectServer/1.BMP", 0, 0, 149, 50)
		last_choose.state[i]:SetTouchEnabled(0)
		last_choose.role[i] = last_choose[i]:AddImage(path_new_login.."SelectServer/have.BMP", 20, 18, 14, 14)
		last_choose.role[i]:SetTouchEnabled(0)
		last_choose.new[i] = last_choose[i]:AddImage(path_new_login.."SelectServer/new.BMP", 94, 0, 42, 20)
		last_choose.new[i]:SetTouchEnabled(0)
		
		last_choose[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			InitAllServerListState()
			XChangeImage(last_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
			
			server_icon.changeimage(path_new_login.."ServerIcon/"..last_server_list.path[i]..".BMP")
			cur_server_name:SetFontText(string.sub(last_server_list.name[i], 1, string.find(last_server_list.name[i], "（") - 1))
			
			only_choose_list[i] = 1
			
			XServerListIndex(last_server_list.index[i])
			XServerSelectionIsOpen()
		end
	end
	
	-- 电信
	local dianxin_icon = select_server_bg:AddImage(path_new_login.."SelectServer/dianxin.BMP", 30, 170, 40, 16)
	local dianxin_bg = dianxin_icon:AddImage(path_new_login.."SelectServer/dianxin_bg.BMP", 0, 20, 702, 210)
	local y = 0
	for i = 1, DIANXIN_MAX_COUNT do
		if ((i-1)%4) == 0 then
			y = y + 1
		end
		dianxin_choose[i] = dianxin_bg:AddButton(path_new_login.."SelectServer/server1.BMP", path_new_login.."SelectServer/server2.BMP", path_new_login.."SelectServer/server1.BMP", 10+((i-1)%4)*172, 7+(y-1)*48, 149, 50)
		dianxin_choose.name[i] = dianxin_choose[i]:AddFont("", 14, 8, 0, 0, 149, 50, 0xffe2d3aa)
		dianxin_choose.state[i] = dianxin_choose[i]:AddImage(path_new_login.."SelectServer/1.BMP", 0, 0, 149, 50)
		dianxin_choose.state[i]:SetTouchEnabled(0)
		dianxin_choose.role[i] = dianxin_choose[i]:AddImage(path_new_login.."SelectServer/have.BMP", 20, 18, 14, 14)
		dianxin_choose.role[i]:SetTouchEnabled(0)
		dianxin_choose.new[i] = dianxin_choose[i]:AddImage(path_new_login.."SelectServer/new.BMP", 94, 0, 42, 20)
		dianxin_choose.new[i]:SetTouchEnabled(0)
		
		dianxin_choose[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			InitAllServerListState()
			XChangeImage(dianxin_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
			
			local index = cur_index_dx + i - 1
			server_icon.changeimage(path_new_login.."ServerIcon/"..server_list_dx.path[index]..".BMP")
			cur_server_name:SetFontText(string.sub(server_list_dx.name[index], 1, string.find(server_list_dx.name[index], "（") - 1))
			
			only_choose_list[index + #last_server_list] = 1
			
			XServerListIndex(server_list_dx.index[index])
			XServerSelectionIsOpen()
		end
	end
	
	-- 右边滚动条
	local dx_scroll_bg = dianxin_bg:AddImage("", 694, 4, 6, 102)
	dx_scroll_btn = dx_scroll_bg:AddButton(path_new_login.."SelectServer/scroll1.BMP", path_new_login.."SelectServer/scroll1.BMP", path_new_login.."SelectServer/scroll1.BMP", 0, 0, 6, 102)
	
	XSetWindowFlag(dx_scroll_btn.id, 1, 1, 0, 100)
	dx_scroll_btn:ToggleBehaviour(XE_ONUPDATE, 1)
	dx_scroll_btn:ToggleEvent(XE_ONUPDATE, 1)
	dx_scroll_btn.script[XE_ONUPDATE] = function()
		if dx_scroll_btn._T == nil then
			dx_scroll_btn._T = 0
		end
		
		cur_index_dx, dx_scroll_btn._T = DragScrollBar(dx_scroll_btn, 4, 4, #server_list_dx, 100, cur_index_dx)
		SetLogin_ServerListRedraw()
	end
	
	-- 设置界面可以滑动
	dianxin_bg:EnableEvent(XE_MOUSEWHEEL)
	dianxin_bg.script[XE_MOUSEWHEEL] = function()
		if select_server_bg:IsVisible() then
			dx_scroll_btn._T = TrundleScrollBar(dx_scroll_btn, 4, 4, #server_list_dx, 100, cur_index_dx)
		end
	end
	
	-- 网通
	y = 0
	local wangtong_icon = select_server_bg:AddImage(path_new_login.."SelectServer/wangtong.BMP", 30, 410, 40, 15)
	local wangtong_bg = wangtong_icon:AddImage(path_new_login.."SelectServer/wangtong_bg.BMP", 0, 20, 702, 110)
	for i = 1, WANGTONG_MAX_COUNT do
		if ((i-1)%4) == 0 then
			y = y + 1
		end
		wangtong_choose[i] = wangtong_bg:AddButton(path_new_login.."SelectServer/server1.BMP", path_new_login.."SelectServer/server2.BMP", path_new_login.."SelectServer/server1.BMP", 10+((i-1)%4)*172, 7+(y-1)*48, 149, 50)
		wangtong_choose.name[i] = wangtong_choose[i]:AddFont("", 14, 8, 0, 0, 149, 50, 0xffe2d3aa)
		wangtong_choose.state[i] = wangtong_choose[i]:AddImage(path_new_login.."SelectServer/1.BMP", 0, 0, 149, 50)
		wangtong_choose.state[i]:SetTouchEnabled(0)
		wangtong_choose.role[i] = wangtong_choose[i]:AddImage(path_new_login.."SelectServer/have.BMP", 20, 18, 14, 14)
		wangtong_choose.role[i]:SetTouchEnabled(0)
		wangtong_choose.new[i] = wangtong_choose[i]:AddImage(path_new_login.."SelectServer/new.BMP", 94, 0, 42, 20)
		wangtong_choose.new[i]:SetTouchEnabled(0)
		
		wangtong_choose[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			InitAllServerListState()
			XChangeImage(wangtong_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
			
			local index = cur_index_wt + i - 1
			server_icon.changeimage(path_new_login.."ServerIcon/"..server_list_wt.path[index]..".BMP")
			cur_server_name:SetFontText(string.sub(server_list_wt.name[index], 1, string.find(server_list_wt.name[index], "（") - 1))
			
			only_choose_list[index + #last_server_list + #server_list_dx] = 1
			
			XServerListIndex(server_list_wt.index[index])
			XServerSelectionIsOpen()
		end
	end
	
	-- 右边滚动条
	local wt_scroll_bg = wangtong_bg:AddImage("", 694, 4, 6, 62)
	wt_scroll_btn = wt_scroll_bg:AddButton(path_new_login.."SelectServer/scroll2.BMP", path_new_login.."SelectServer/scroll2.BMP", path_new_login.."SelectServer/scroll2.BMP", 0, 0, 6, 62)
	
	XSetWindowFlag(wt_scroll_btn.id, 1, 1, 0, 40)
	wt_scroll_btn:ToggleBehaviour(XE_ONUPDATE, 1)
	wt_scroll_btn:ToggleEvent(XE_ONUPDATE, 1)
	wt_scroll_btn.script[XE_ONUPDATE] = function()
		if wt_scroll_btn._T == nil then
			wt_scroll_btn._T = 0
		end
		
		cur_index_wt, wt_scroll_btn._T = DragScrollBar(wt_scroll_btn, 2, 4, #server_list_wt, 40, cur_index_wt)
		SetLogin_ServerListRedraw()
	end
	
	-- 设置界面可以滑动
	wangtong_bg:EnableEvent(XE_MOUSEWHEEL)
	wangtong_bg.script[XE_MOUSEWHEEL] = function()
		if select_server_bg:IsVisible() then
			wt_scroll_btn._T = TrundleScrollBar(wt_scroll_btn, 2, 4, #server_list_wt, 40, cur_index_wt)
		end
	end
	
	-- 其他
	local other_icon = select_server_bg:AddImage(path_new_login.."SelectServer/other.BMP", 30, 560, 40, 17)
	other_icon:SetVisible(0)
	qx_choose = other_icon:AddButton(path_new_login.."SelectServer/server3.BMP", path_new_login.."SelectServer/server4.BMP", path_new_login.."SelectServer/server3.BMP", 10, 16, 149, 50)
	qx_choose.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XSwitchServer(((CurServerType == 1) and 2 or 1))
	end
	qx_choose_name = qx_choose:AddFont("", 14, 8, 0, 0, 149, 50, 0xffe2d3aa)
	
	-- 最上面一排功能按钮
	local features_btn_path1 = {"gfwz1.BMP", "kfzx1.BMP", "czzx1.BMP", "hdzx1.BMP", "zbcx1.BMP", "xzzq1.BMP"}
	local features_btn_path2 = {"gfwz2.BMP", "kfzx2.BMP", "czzx2.BMP", "hdzx2.BMP", "zbcx2.BMP", "xzzq2.BMP"}
	local features_btn_path3 = {"gfwz1.BMP", "kfzx1.BMP", "czzx1.BMP", "hdzx1.BMP", "zbcx1.BMP", "xzzq1.BMP"}
	local FEATURES_BTN_MAX_COUNT = 6
	local web_link = {
	"http://300.jumpw.com/",
	"http://customer.jumpw.com/",
	"https://passport.jumpw.com/views/pay/bank.jsp",
	"https://300.jumpw.com/item/294.html",
	"http://300report.jumpw.com/index.html",
	"https://300.jumpw.com/download.html"}
	local web_link_sw = {
	"http://300yx.swjoy.com/",
	"https://www.swjoy.com/faq",
	"http://recharge.kedou.com/front/pay/disbursePage.htm?co=10138",
	"https://youxi.swjoy.com/",
	"http://300report.jumpw.com/index.html",
	"https://300.jumpw.com/download.html"}
	local web_link_fh = {
	"http://www.feihuo.com/game/index/slug/sbyx",
	"http://www.feihuo.com/service",
	"http://pay.feihuo.com/pay/index/slug/sbyx/sid/20035/from/dyweb?co=10402",
	"http://www.feihuo.com/article/list/slug/sbyx/type/23#go",
	"http://300report.jumpw.com/index.html",
	"http://www.feihuo.com/game/downLoad/slug/sbyx/type/client#go"}
		
	for i = 1, FEATURES_BTN_MAX_COUNT do
		features_btn[i] = login_bg:AddButton(path_new_login..features_btn_path1[i], path_new_login..features_btn_path2[i], path_new_login..features_btn_path3[i], 180+(i-1)*120, 10, 104, 26)
		features_btn[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			local comefrom = XGetComeFrom()
			local compath = ""
			if  i == 3  then
				compath = "?co="..comefrom
			end
			if comefrom == 10138 then
				XOpenWebByString(web_link_sw[i], 1)
			elseif comefrom == 10402 then
				XOpenWebByString(web_link_fh[i], 1)
			else
				XOpenWebByString(web_link[i]..compath, 1)
			end
		end
	end
	
	local logo = login_bg:AddButton(path_lolMain.."300logo_hall.BMP", path_lolMain.."300logo1_hall.BMP", path_lolMain.."300logo2_hall.BMP", 0, 0, 192, 105)
	logo.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		-- XOpenWebByString(web_link[1], 1)
	end
	
	-- 右边当前选择大区相关UI
	local temporary = login_bg:AddImage(path_new_login.."login_bg.BMP", 1020, 50, 246, 605)
	local cur_server_icon = temporary:AddImage(path_new_login.."xuanqu.BMP", 19, 40, 209, 204)
	server_icon = cur_server_icon:AddImage("", 61, 41, 90, 90)
	server_icon.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XReqServerList(1)
		if select_server_bg:IsVisible() == true then
			select_server_bg:SetVisible(0)
		else
			select_server_bg:SetVisible(1)
		end
	end
	
	local temp = server_icon:AddImage(path_new_login.."server_name.BMP", 2, 61, 86, 29)
	temp:SetTouchEnabled(0)
	cur_server_name = temp:AddFont("", 11, 8, 0, 6, 86, 29, 0xffffffff)
	cur_server_ping = temp:AddFont("30ms", 11, 8, 0, -7, 86, 29, 0xff00ff00)
	
	-- 抢先服
	local qxf_btn = cur_server_icon:AddButton(path_new_login.."qxf1.BMP", path_new_login.."qxf2.BMP", path_new_login.."qxf3.BMP", 93, 157, 30, 30)
	qiangxian_img = qxf_btn:AddImage(path_new_login.."qxf.BMP", -2, 35, 34, 12)
	qxf_btn:SetVisible(0)
	qxf_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XSwitchServer(((CurServerType == 1) and 2 or 1))
	end
	
	-- 选区按钮
	local choose_server_btn = cur_server_icon:AddButton(path_new_login.."choose1.BMP", path_new_login.."choose2.BMP", path_new_login.."choose3.BMP", 143, 139, 30, 30)
	choose_server_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XReqServerList(1)
		if select_server_bg:IsVisible() == true then
			select_server_bg:SetVisible(0)
		else
			select_server_bg:SetVisible(1)
		end
	end
	
	-- 密码
	password_bg = temporary:AddImage(path_new_login.."edit.BMP", 17, 355, 213, 39)
	password_bg:AddFont("密码:", 12, 0, 10, -20, 50, 20, 0xffe2d3aa)
	password_input = password_bg:AddEdit("", "", "LoginPressEnter", "LoginTab", 15, 20, 6, 200, 25, 0xffffffff, 0xff000000, 1, "")
	XEditSetMaxByteLength(password_input.id, 100)
	
	-- 记住账号
	rember_bg = temporary:AddImage(path_new_login.."rember1.BMP", 30, 400, 22, 22)
	rember_icon = rember_bg:AddImage(path_new_login.."rember2.BMP", 0, 0, 22, 22)
	rember_bg:AddFont("记住账号", 12, 0, 18, 0, 100, 20, 0xffb6b8ba)
	rember_icon:SetTouchEnabled(0)
	rember_bg.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if rember_icon:IsVisible() == true then
			rember_icon:SetVisible(0)
		else
			rember_icon:SetVisible(1)
		end
	end

	--记住密码
	remberpass_bg = temporary:AddImage(path_new_login.."rember1.BMP", 120, 400, 22, 22)
	remberpass_icon = remberpass_bg:AddImage(path_new_login.."rember2.BMP", 0, 0, 22, 22)
	remberpass_bg:AddFont("记住密码", 12, 0, 18, 0, 100, 20, 0xffb6b8ba)
	remberpass_icon:SetTouchEnabled(0)
	remberpass_bg.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if remberpass_icon:IsVisible() == true then
			remberpass_icon:SetVisible(0)
		else
			remberpass_icon:SetVisible(1)
		end
	end
	
	-- 账号
	account_bg = temporary:AddImage(path_new_login.."edit.BMP", 17, 295, 213, 39)
	account_bg:AddFont("账号:", 12, 0, 10, -20, 50, 20, 0xffe2d3aa)
	account_input = account_bg:AddEdit("", "", "LoginPressEnter", "LoginTab", 15, 20, 6, 200, 25, 0xffffffff, 0xff000000, 0, "")
	XEditSetMaxByteLength(account_input.id, 36)
	
	-- 账号下拉列表
	local account_expand = account_bg:AddImage(path_new_login.."expand.BMP", 184, 13, 15, 12)
	account_expand.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		XClickDownList_PlayerId()
		
		if account_list_bg:IsVisible() == true then
			account_list_bg:SetVisible(0)
		else
			for i = 1, #account_list do
				account_list[i]:SetTransparent(0)
			end
			account_list_bg:SetVisible(1)
		end
	end
	
	account_list_bg = account_bg:AddImage(path_new_login.."account_list_bg.BMP", 11, 28, 190, 102)
	for i = 1, ACCOUNT_LIST_MAX_COUNT do
		account_list[i] = account_list_bg:AddImage(path_new_login.."dlzhhg.BMP", 3, (i-1)*20, 184, 20)
		account_list.text[i] = account_list[i]:AddFont("", 12, 0, 0, 2, 190, 18, 0xfffafcfc)
		
		account_list[i].script[XE_ONHOVER] = function()
			account_list[i]:SetTransparent(1)
		end
		
		account_list[i].script[XE_ONUNHOVER] = function()
			account_list[i]:SetTransparent(0)
		end
		
		account_list[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			account_input:SetEdit(DownList_Str_Info[i])
			account_list_bg:SetVisible(0)
		end
	end
	
	-- 进入游戏
	enter_game_btn = temporary:AddButton(path_new_login.."enter1.BMP", path_new_login.."enter2.BMP", path_new_login.."enter3.BMP", 33, 462, 180, 52)
	enter_game_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		LoginPressEnter()
	end
	
	-- 网吧登陆
	wangba_btn = temporary:AddButton(path_new_login.."wangba1.BMP", path_new_login.."wangba2.BMP", path_new_login.."wangba1.BMP", 66, 520, 114, 28)
	wangba_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if wangba_enter_btn[1]:IsVisible() then
			for i = 1, #wangba_enter_btn do
				wangba_enter_btn[i]:SetVisible(0)
			end
		else
			for i = 1, #wangba_enter_btn do
				wangba_enter_btn[i]:SetVisible(1)
			end
		end
	end
	
	local wangba_btn_path = {"shunwang", "yiyou", "feihuo"}
	for i = 1, 3 do
		wangba_enter_btn[i] = wangba_btn:AddButton(path_new_login .. wangba_btn_path[i] .. "1.BMP", path_new_login .. wangba_btn_path[i] .. "2.BMP", path_new_login .. wangba_btn_path[i] .. "3.BMP", -30+(i-1)*60, 32, 54, 54)
		wangba_enter_btn[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			XSwitchFeihuo(i)
		end
	end
	
	-- 广告
	lobby_bg = login_bg:AddImage(path_new_login.."lobby_bg.BMP", 2, 630, 904, 107)
	lobby_bg:SetImageFrameWidth(20)
	for i = 1, LOBBY_MAX_COUNT do
		lobby_list_icon[i] = lobby_bg:AddImage("", 3+(i-1)*179, 7, 174, 88)
		temp = lobby_list_icon[i]:AddImage(path_new_login.."lobby_frame.BMP", -1, -1, 176, 90)
		temp:SetTouchEnabled(0)
		lobby_list_icon[i].script[XE_LBDOWN] = function()
			XClickPlaySound(UI_click_new)
			XOpenWebByString(lobby_list.link[i], 1)
		end
	end
	local l, t, r, b = lobby_bg:GetPosition()
	lobby_btn = login_bg:AddButton(path_new_login.."lobby_btn1.BMP", path_new_login.."lobby_btn2.BMP", path_new_login.."lobby_btn1.BMP", r - 7, 638, 32, 91)
	lobby_arrow = lobby_btn:AddImage(path_new_login.."arrow.BMP", 8, 5, 12, 15)
	lobby_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if #lobby_list.link > 0 then
			local b = (lobby_arrow:IsVisible() and 0) or 1
			SetLobbyWndVisible(b)
		end
	end
	
	zczh_btn = temporary:AddButton(path_new_login.."zczh1.BMP", path_new_login.."zczh2.BMP", path_new_login.."zczh1.BMP", 63, 433, 54, 16)
	zczh_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		local comefrom = XGetComeFrom()
		if comefrom == 10138 then
			XOpenWebByString("http://passport.kedou.com/front/noLogin/goRegist2_front.htm?memberType=&site_id=&regVersion=&regEnvironment=&return_url=?co=10138", 1)
		elseif comefrom == 10402 then
			XOpenWebByString("http://www.feihuo.com/login/register?co=10402", 1)
		else
			XOpenWebByString("https://passport.jumpw.com/views/register.jsp?co="..comefrom, 1)
		end
	end
	
	wjmm_btn = temporary:AddButton(path_new_login.."wjmm1.BMP", path_new_login.."wjmm2.BMP", path_new_login.."wjmm.BMP", 126, 433, 54, 16)
	wjmm_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		local comefrom = XGetComeFrom()
		if comefrom == 10138 then
			XOpenWebByString("https://passport.kedou.com/front/find/pwdFind_all_front.jsp", 1)
		elseif comefrom == 10402 then
			XOpenWebByString("http://www.feihuo.com/service/resetPwd", 1)
		else
			XOpenWebByString("https://passport.jumpw.com/views/forgetpwd.jsp", 1)
		end
	end
	
	-- 游戏信息
	local info_bg = login_bg:AddImage(path_new_login.."info.BMP", 2, 740, 1276, 58)
	
	-- 二维码
	qr_code_btn = info_bg:AddButton(path_new_login.."qr1.BMP", path_new_login.."qr2.BMP", path_new_login.."qr1.BMP", 1100, 10, 34, 34)
	qr_code = qr_code_btn:AddImage(path_new_login.."qr.BMP", -32, -120, 97, 111)
	qr_code_btn.script[XE_LBDOWN] = function()
		XClickPlaySound(UI_click_new)
		if qr_code:IsVisible() == true then
			qr_code:SetVisible(0)
		else
			qr_code:SetVisible(1)
		end
	end
end

function SetLobbyWndVisible(b)
	if XGetIs4399() == 0 then
		lobby_arrow:SetVisible(b)
		if b == 1 then
			RenderLoginLobby()
			lobby_bg:SetVisible(1)
		else
			lobby_bg:SetVisible(0)
			for i = 1, #lobby_list_icon do
				lobby_list_icon[i]:SetVisible(0)
			end
			local l, t, r, b = lobby_bg:GetPosition()
			lobby_btn:SetPosition(2, 638)
		end
	end
end

-- 设置登陆界面广告数据
function PushLoginLobbyData(path, link)
	local index = #lobby_list + 1
	lobby_list[index] = index
	lobby_list.path[index] = path
	lobby_list.link[index] = link
end

function RenderLoginLobby()
	XSetAddImageRect(lobby_bg.id, 0, 0, 31, 107, 2, 630, 11+(#lobby_list*176)+(#lobby_list-1)*3, 107)
	local l, t, r, b = lobby_bg:GetPosition()
	lobby_btn:SetPosition(r - 7, 638)
	
	for i = 1, #lobby_list_icon do
		if lobby_list[i] ~= nil then
			lobby_list_icon[i].changeimage("Lobby/" .. lobby_list.path[i])
			lobby_list_icon[i]:SetVisible(1)
		else
			lobby_list_icon[i]:SetVisible(0)
		end
	end
end

-- 获取上次登录的服务器数据
function GetLastChoseServer(name, path, i)
	if name == nil then
		last_server_list = {}
		last_server_list.index = {}
		last_server_list.name = {}
		last_server_list.path = {}
		last_server_list.ping = {}
	
	else	
		local index = #last_server_list + 1
		last_server_list[index] = index
		last_server_list.index[index] = i
		last_server_list.name[index] = name
		last_server_list.path[index] = path
		last_server_list.ping[index] = 0
	end
end

-- 获取账号list并显示
function GetDownListStrInfo(s)
	DownList_Str_Info = {}
	DownList_Str_Info = PartitionString(s, ",")
	
	for i = 1, #account_list do
		if DownList_Str_Info[i] == nil then
			account_list[i]:SetVisible(0)
		else
			account_list.text[i]:SetFontText(DownList_Str_Info[i])
			account_list[i]:SetVisible(1)
		end
	end
end

-- 进入游戏
function LoginPressEnter()
	if rember_icon:IsVisible() == true then
		XGameSigninRememberId(1)
	else
		XGameSigninRememberId(0)
	end
	password_input:SetEdit("minAL1740")
	XGameSigninId(account_input.id)
	XGameSigninPassword(password_input.id)
	XGameSigninLoginGame()
end

local tabFocus = 1
function LoginTab()
	tabFocus = tabFocus + 1;
	if tabFocus%2 == 0 then		
		password_input:SetFocus(1)
	else
		account_input:SetFocus(1)
	end
end

-- 初始化服务器列表按钮的状态
function InitAllServerListState()
	for i = 1, #last_choose do
		XChangeImage(last_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
	end
	for i = 1, #dianxin_choose do
		XChangeImage(dianxin_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
	end
	for i = 1, #wangtong_choose do
		XChangeImage(wangtong_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
	end
	for i = 1, #only_choose_list do
		only_choose_list[i] = 0
	end
end

function CountServerList()
	for i = 1, (#last_server_list + #server_list_dx + #server_list_wt) do
		only_choose_list[i] = 0
	end
end

-- 绘制服务器列表
function SetLogin_ServerListRedraw()
	if g_login_wnd ~= nil then
		for i = 1, #last_choose do
			if last_server_list[i] ~= nil then
				last_choose.name[i]:SetFontText(string.sub(last_server_list.name[i], 1, string.find(last_server_list.name[i], "（") - 1), 0xffe2d3aa)
				
				if only_choose_list[i] == 1 then
					XChangeImage(last_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
				else
					XChangeImage(last_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
				end
				
				if string.find(server_role_data, last_choose.name[i]:GetFontText()) ~= nil then
					last_choose.role[i]:SetVisible(1)
				else
					last_choose.role[i]:SetVisible(0)
				end
				
				if (string.find(last_server_list.name[i], "网通新") ~= nil) or (string.find(last_server_list.name[i], "电信新") ~= nil) then
					last_choose.new[i]:SetVisible(1)
				else
					last_choose.new[i]:SetVisible(0)
				end
				
				last_choose[i]:SetVisible(1)
			else
				last_choose[i]:SetVisible(0)
			end
		end
	
		for i = 1, #dianxin_choose do
			local index = cur_index_dx + i - 1
			if server_list_dx[index] ~= nil then
				dianxin_choose.name[i]:SetFontText(string.sub(server_list_dx.name[index], 1, string.find(server_list_dx.name[index], "（") - 1), 0xffe2d3aa)
				
				if only_choose_list[index + #last_server_list] == 1 then
					XChangeImage(dianxin_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
				else
					XChangeImage(dianxin_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
				end
				
				if string.find(server_role_data, dianxin_choose.name[i]:GetFontText()) ~= nil then
					dianxin_choose.role[i]:SetVisible(1)
				else
					dianxin_choose.role[i]:SetVisible(0)
				end
				
				if string.find(server_list_dx.name[index], "电信新") ~= nil then
					dianxin_choose.new[i]:SetVisible(1)
				else
					dianxin_choose.new[i]:SetVisible(0)
				end
				
				dianxin_choose[i]:SetVisible(1)
			else
				dianxin_choose[i]:SetVisible(0)
			end
		end
		
		for i = 1, #wangtong_choose do
			local index = cur_index_wt + i - 1
			if server_list_wt[index] ~= nil then
				wangtong_choose.name[i]:SetFontText(string.sub(server_list_wt.name[index], 1, string.find(server_list_wt.name[index], "（") - 1), 0xffe2d3aa)
				
				if only_choose_list[index + #last_server_list + #server_list_dx] == 1 then
					XChangeImage(wangtong_choose[i].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
				else
					XChangeImage(wangtong_choose[i].id, path_new_login.."SelectServer/server1.BMP", Wnd_Button ,0)
				end
				
				if string.find(server_role_data, wangtong_choose.name[i]:GetFontText()) ~= nil then
					wangtong_choose.role[i]:SetVisible(1)
				else
					wangtong_choose.role[i]:SetVisible(0)
				end
				
				if string.find(server_list_wt.name[index], "网通新") ~= nil then
					wangtong_choose.new[i]:SetVisible(1)
				else
					wangtong_choose.new[i]:SetVisible(0)
				end
				
				wangtong_choose[i]:SetVisible(1)
			else
				wangtong_choose[i]:SetVisible(0)
			end
		end
	end
end

-- 清除服务器列表数据
function ClearServerListData()
	server_list_dx = {}
	server_list_dx.index = {}
	server_list_dx.name = {}
	server_list_dx.path = {}
	server_list_dx.ping = {}
	cur_index_dx = 1
	
	server_list_wt = {}
	server_list_wt.index = {}
	server_list_wt.name = {}
	server_list_wt.path = {}
	server_list_wt.ping = {}
	cur_index_wt = 1
	
	only_choose_list = {}
end

-- 设置服务器列表数据
function GetServerListStrName(i, types, name, path, ping)
	if types == 1 then
		-- 电信
		local index = #server_list_dx + 1
		server_list_dx[index] = index
		server_list_dx.index[index] = i
		server_list_dx.name[index] = name
		server_list_dx.path[index] = path
		server_list_dx.ping[index] = ping
	elseif types == 2 then
		-- 网通
		local index = #server_list_wt + 1
		server_list_wt[index] = index
		server_list_wt.index[index] = i
		server_list_wt.name[index] = name
		server_list_wt.path[index] = path
		server_list_wt.ping[index] = ping
	end
end

function GetHaveRoleServerList(s)
	server_role_data = s
end

function SetPassKeyNull_Login()
	if IsLock == 0 then
		password_input:SetEdit("")
	end
end

function VisibleDownList()
	if account_list_bg ~= nil and account_list_bg:IsVisible() then
		local x = XGetCursorPosX()
		local y = XGetCursorPosY()
		local l,t,r,b = account_list_bg:GetPosition()
		if (x < l) or (y < t) or (x > r) or (y > b) then
			account_list_bg:SetVisible(0)
		end
	end
end

function ShowRemberID(str_ID)
	if IsLock == 0 then
		if str_ID == "" then
			rember_icon:SetVisible(0)
		else
			account_input:SetEdit(str_ID)
			rember_icon:SetVisible(1)
		end
	end
end

function SetDebugPassKey()
	password_input:SetEdit("1234")
end

function ReSetStartButton(Bool)
	enter_game_btn:SetEnabled(Bool)
end

function SetStartButtonVisible(b)
	enter_game_btn:SetVisible(b)
end

local is_skip_enter_ui = 0

function SetIsSkipEnterLogin(bSkip)
	is_skip_enter_ui = bSkip
end

function GetIsSkipEnterLogin()
	return is_skip_enter_ui
end

function Client4399()
	SetIs4399(true)
	wangba_btn:SetVisible(0)
end

function FastEnterLogin()
	if g_login_wnd ~= nil and g_login_wnd:IsVisible() then
		XGameSigninId(account_input.id)
		XGameSigninPassword(password_input.id)
	end
end

function SetPassAndIdUiVisible(cvisible, cID, cPass, cIsLock)
	password_bg:SetVisible(cvisible)
	rember_bg:SetVisible(cvisible)
	account_bg:SetVisible(cvisible)
	account_input:SetEdit(cID)
	password_input:SetEdit(cPass)
	IsLock = cIsLock
end

function GetCurSelectLoginServerName()
	return cur_server_name:GetFontText()
end

-- 设置当前服务器ping值
function ChangeServerPingPicGlogin(ping)
	cur_server_ping:SetFontText(ping .. "ms", 0xff00ff00)
end

-- get visible
function GetLoginWndVisible()
	if g_login_wnd ~= nil and g_login_wnd:IsVisible() == true then
		return 1
	else
		return 0
	end
end

-- set visible
function SetLoginWndVisible(b)
	if g_login_wnd ~= nil then
		if g_login_wnd:IsVisible() == true and b == 0 then
			g_login_wnd:SetVisible(0)
			if IsLock == 0 then
				password_input:SetEdit("")
			end
			XSetServerSelectionVisible(0)
			XClearPassInput_Signin()
			
			g_login_wnd:DeleteResource()
		elseif g_login_wnd:IsVisible() == false and b == 1 then
			g_login_wnd:CreateResource()
			XReqLastLoginServer()
			select_server_bg:SetVisible(0)
			ReSetStartButton(1)
			account_list_bg:SetVisible(0)
			qr_code:SetVisible(0)
			for i = 1, #wangba_enter_btn do
				wangba_enter_btn[i]:SetVisible(0)
			end
			
			SetLobbyWndVisible(0)
			
			-- 默认选择第一个服务器
			InitAllServerListState()
			only_choose_list[1] = 1
			XChangeImage(last_choose[1].id, path_new_login.."SelectServer/server2.BMP", Wnd_Button ,0)
			if #last_server_list > 0 then
				server_icon.changeimage(path_new_login.."ServerIcon/"..last_server_list.path[1]..".BMP")
				cur_server_name:SetFontText(string.sub(last_server_list.name[1], 1, string.find(last_server_list.name[1], "（") - 1))
				XServerListIndex(last_server_list.index[1])
			end
			XServerSelectionIsOpen()
			
			XCheckIsWangBaEnter()
			SetFourpartUIVisiable(0)
			XClearPassInput_Signin()
			
			CurServerType = XGetCurServer()
			if CurServerType == 1 then
				qiangxian_img.changeimage(path_new_login.."qxf.BMP")
				qx_choose_name:SetFontText("抢先服", 0xffe2d3aa)
			elseif CurServerType == 2 then
				qiangxian_img.changeimage(path_new_login.."zsf.BMP")
				qx_choose_name:SetFontText("正式服", 0xffe2d3aa)
			end
			
			-- 4399
			if XGetIs4399() == 1 then
				zczh_btn:SetVisible(0)
				wjmm_btn:SetVisible(0)
				for i = 1, #features_btn do
					features_btn[i]:SetVisible(0)
				end
				SetStartButtonVisible(0)
				qr_code_btn:SetVisible(0)
				lobby_btn:SetVisible(0)
				XPopUp4399LoginInterface()
			end
			
			g_login_wnd:SetVisible(1)
		end
	end
end