include("../Data/Script/Common/include.lua")
include("../Data/Script/Common/SwitchCardEffect.lua")

local SKIN_LISTL_BTN = {}			-- 图片按钮
local SKIN_LISTL_HIDE = {}			-- 图片遮罩
local SKIN_LISTL_HOVER = {}			-- 图片划过边框
local SKIN_LISTL_NAME = nil			-- 皮肤名称
-- local SKIN_LISTL_HAVE = {}			-- 皮肤是否拥有
local SKIN_LISTL_BUY = nil			-- 皮肤购买按钮
local SKIN_LISTL_BUYGold = {}		-- 皮肤购买按钮对应的钻石图片
local SKIN_LISTL_PRICE = {}			-- 皮肤钻石价格
local skin_heroname = {}
local SKIN_LISTL = {}
SKIN_LISTL.BK = {}
SKIN_LISTL.NAME = {}
SKIN_LISTL.HAVE = {}
SKIN_LISTL.POSXS = 236
SKIN_LISTL.POSYS = 125
SKIN_LISTL.POSWS = 106
SKIN_LISTL.POSHS = 160

SKIN_LISTL.PRICE = { 999, 898, 887, 666}
SKIN_LISTL.POSX = { 0, 0, 0, 0}
SKIN_LISTL.POSY = { 0, 0, 0, 0}
SKIN_LISTL.POSW = { 110, 110, 110, 110}
SKIN_LISTL.POSH = { 170, 170, 170, 170}
local IsCanSelSkin = 0				-- 是否能够设置皮肤
local heroid_skinframe = 0
local CurSelSkin = {}

local SkinMaxCount = 0
local IsHave = {}
local SkinID = {}
local skinimgpath_skinframe = {}
local Skin_LevelImg = {}
local Skin_Level = {}
--local LastSelSkinIndex = 0
local LeftPageButton = nil
local RightPageButton = nil
local CurPage = 1					-- 当前
local MinPage = 1
local MaxPage = 4
local IndexPage = 1

local m_IsHaveImage = {}
local TimeLimitSkin = {}
local SellTypeList = {path_lolcommon.."gold.BMP",path_lolcommon.."vip.BMP"}



--新UI
local SkinFrameBK = nil
local SwitchEffect = nil

function InitGame_SkinFrame(wnd, bisopen)
	g_game_SkinFrame_ui = CreateWindow( wnd.id, 764,405,472,250)
	InitMainGame_SkinFrame( g_game_SkinFrame_ui)
	g_game_SkinFrame_ui:SetVisible( bisopen)
end
function InitMainGame_SkinFrame(wnd)
	local CullRect = CreateWindow(wnd.id,166,141,220,124)--大窗口
	CullRect:SetWindowScissorRect(0,-16,472,266)
	
	SkinFrameBK = CreateWindow( CullRect.id, 0,16,472,250)
	SkinFrameBK:AddImage(path_lolhero.."skinTitle.BMP",3000,-16,253,33)--皮肤按钮
	
	SwitchEffect = SwitchCardEffect:Init(SkinFrameBK,0,0,472,250)

	local px = {38,44,38,38,38,38,38,38,38,38}
	local py = {61,72,61,61,61,61,61,61,61,61}
	local pw = {23,27,23,23,23,23,23,23,23,23}
	local ph = {32,37,32,32,32,32,32,32,32,32}
	
	local x = SKIN_LISTL.POSXS - SKIN_LISTL.POSWS*0.5
	local y = SKIN_LISTL.POSYS - SKIN_LISTL.POSHS*0.5
	for i=1, 10 do
		SKIN_LISTL_BTN[i] = SkinFrameBK:AddImage( path_hero.."ffffff_hero.BMP", x, y,76-8,110)--皮肤图片
		SKIN_LISTL_BTN[i]:SetTouchEnabled(1)
				
		SKIN_LISTL_HIDE[i] = SKIN_LISTL_BTN[i]:AddImage( path_lolhero.."skinhide.BMP", -4, -4,76,118)--框
		SKIN_LISTL_HIDE[i]:SetTouchEnabled(0)
		SKIN_LISTL_HIDE[i]:SetVisible(1)
		
		SKIN_LISTL_HOVER[i] = SKIN_LISTL_BTN[i]:AddImage( path_lolhero.."skinside_hero2.BMP", -4,-4,76,118)--框
		SKIN_LISTL_HOVER[i]:SetTouchEnabled(0)
		SKIN_LISTL_HOVER[i]:SetVisible(1)
		
		local A = SKIN_LISTL_BTN[i]:AddImage( path_lolhero.."skinside_hero.BMP", -4, -4,76,118)--框
		A:SetTouchEnabled(0)
		m_IsHaveImage[i] = A:AddImage( path_lolhero.."Lock.BMP", 29, 58, 16, 20)--锁
		m_IsHaveImage[i]:SetTouchEnabled(0)
		SKIN_LISTL_BUYGold[i] = m_IsHaveImage[i]:AddImage(path_lolcommon.."gold.BMP", -20, 28, 24, 24 )--钻石4 27
		SKIN_LISTL_BUYGold[i]:SetTouchEnabled(0)
		SKIN_LISTL_PRICE[i] = SKIN_LISTL_BUYGold[i]:AddFont( "", 15, 8, 40, 5, 156, 31, 0xa6fffe)--文字/文字，字体大小，对齐方向，左，顶，宽，高，文字颜色
			
		-- 皮肤按钮
		SKIN_LISTL_BTN[i].script[XE_LBUP] = function()
			XClickPlaySound(UI_hero_skin_new)
			
			--选择皮肤
			if heroid_skinframe==168 and i+CurPage-1==3 then
				XSelSkinEnterGame_skinframe(IsCanSelSkin, 9, SkinID[i])
			elseif SkinID[i]==0 then
				XSelSkinEnterGame_skinframe(IsCanSelSkin,(i+IndexPage-1), SkinID[i])
			else
				XSelSkinEnterGame_skinframe(IsCanSelSkin, (i+IndexPage-1), SkinID[i])--IsCanSelSkin==1确定使用皮肤,0单纯的替换背景
			end
			
			-- 购买
			if i==SwitchEffect.centerWndIdx and IsHave[i]<=0 and m_IsHaveImage[SwitchEffect.centerWndIdx]:IsVisible()==true then
				XSetShopBuyType(eShopBuy_Normal)
				XClickBuyHeroSkinButton_Lua( heroid_skinframe, i+CurPage-SwitchEffect.centerWndIdx, SkinID[i])
			end
			
			-- -- 左右键
			-- -- if i==1 and SkinID[i] ~= nil then
				-- -- 选皮肤出击
				-- if heroid_skinframe==168 and i+CurPage-1==3 then
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin, 9, SkinID[i])
				-- elseif SkinID[i]==0 then
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin,(i+IndexPage-1), SkinID[i])
				-- else
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin, (i+IndexPage-1), SkinID[i])--IsCanSelSkin==1确定使用皮肤,0单纯的替换背景
				-- end
			-- -- elseif i==3 and SkinID[i] ~= nil then			
				-- -- 选皮肤出击
				-- if heroid_skinframe==168 and i+CurPage-1==3 then
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin, 9, SkinID[i])
				-- elseif SkinID[i]==0 then
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin,(i+IndexPage-1), SkinID[i])
				-- else
					-- XSelSkinEnterGame_skinframe(IsCanSelSkin, (i+IndexPage-1), SkinID[i])--IsCanSelSkin==1确定使用皮肤,0单纯的替换背景
				-- end
			-- -- end
			
			
			for k,v in pairs(SKIN_LISTL_BUYGold) do
				if i==k then
					SKIN_LISTL_BUYGold[k]:SetVisible(1)
				else
					SKIN_LISTL_BUYGold[k]:SetVisible(0)
				end
			end
			
			SwitchEffect:Click(i)
		end
		
		SKIN_LISTL_BTN[i].script[XE_ONHOVER] = function()
			SKIN_LISTL_HOVER[i]:SetVisible(1)
		end
		
		SKIN_LISTL_BTN[i].script[XE_ONUNHOVER] = function()
			SKIN_LISTL_HOVER[i]:SetVisible(0)
		end
		-- 皮肤购买
		
		TimeLimitSkin[i] = SKIN_LISTL_BTN[i]:AddFont( "", 12, 8, 10, -135, 128, 72, 0xff0000)		
		CurSelSkin[i] = SKIN_LISTL_BTN[i]:AddImage( path_lolhero.."skinside_hero3.BMP", -11,-11, 90, 132)
		CurSelSkin[i]:SetVisible(0)
		CurSelSkin[i]:SetTouchEnabled(0)
	end
	
	LeftPageButton = SkinFrameBK:AddButton( path_lolhero.."L1.BMP",path_lolhero.."L2.BMP",path_lolhero.."L1.BMP",1,134,28,28)
	RightPageButton = SkinFrameBK:AddButton( path_lolhero.."R1.BMP",path_lolhero.."R2.BMP",path_lolhero.."R1.BMP",443,134,28,28)
	LeftPageButton:SetVisible(0)
	RightPageButton:SetVisible(0)
	LeftPageButton.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
				
		-- -- 左翻页
		-- if CurPage>MinPage then
			-- CurPage = CurPage - 1
		-- end		
		
		-- if MaxPage==1 then
			-- IndexPage = IndexPage - 1
			-- local page = math.max(IndexPage,MinPage)
			-- page = math.min(page,MaxPage)
			-- XClickPageButton_SkinFrame(page)
		-- elseif MaxPage==2 then
			-- IndexPage = IndexPage - 1
			-- local page = math.max(IndexPage,MinPage)
			-- page = math.min(page,MaxPage)
			-- XClickPageButton_SkinFrame(page)
		-- elseif MaxPage>=3 then
			-- IndexPage = IndexPage - 1
			-- XClickPageButton_SkinFrame(IndexPage)
		-- end
	end
	
	RightPageButton.script[XE_LBUP] = function()
		XClickPlaySound(UI_click_new)
				
		-- -- 右翻页
		-- if CurPage < MaxPage then
			-- CurPage = CurPage + 1
		-- end
		
		-- if MaxPage==1 then
			-- IndexPage = IndexPage + 1
			-- local page = math.max(IndexPage,MinPage)
			-- page = math.min(page,MaxPage)
			-- XClickPageButton_SkinFrame(page)
		-- elseif MaxPage==2 then
			-- IndexPage = IndexPage + 1
			-- local page = math.max(IndexPage,MinPage)
			-- page = math.min(page,MaxPage)
			-- XClickPageButton_SkinFrame(page)
		-- elseif MaxPage>=3 then
			-- IndexPage = IndexPage + 1
			-- XClickPageButton_SkinFrame(IndexPage)
		-- end
	end
end



-- 根据不同界面设置位置
function SetSkinWindowPos( state)
	if state==0 then
	
	elseif state==1 then
		g_game_SkinFrame_ui:SetPosition( 764,405)
	elseif state==2 then
		g_game_SkinFrame_ui:SetPosition( 764,405)
	elseif state==3 then
		g_game_SkinFrame_ui:SetPosition( 764,405)
	end
end

-- 设置是否能够选择皮肤，返回大厅时设置否，点击确定时设置是
function IsCanSelSkin_skinframe( cIsCan )
	IsCanSelSkin = cIsCan

	if IsCanSelSkin == 1 then
		-- 点击确定之后可以选择使用皮肤
		for i=1, 3 do
			-- SKIN_LISTL_BUY:SetVisible(0)
		end
	else
		-- 未点确定只能选择购买皮肤
		for i=1, 3 do
			-- SKIN_LISTL_BUY:SetVisible(1)
		end
	end
end


-- 设置皮肤数据
function SetSkinSizeAndInfo_skinframe( cPath, cIsHave, cheroid, cSkinID, cskinlv, cGold, selltype, cindex, cCount, curpage)-- cSkinName, cXB, cYB, cWid, cHei,
-- log("\ncindex = "..cindex.."   ,cIsHave = "..cIsHave.."   ,cCount = "..cCount.."   ,cSkinID = "..cSkinID.."   ,curpage = "..curpage)

	heroid_skinframe = cheroid
	skinimgpath_skinframe[cindex] = ".."..cPath
	IsHave[cindex] = cIsHave
	SkinID[cindex] = cSkinID
	Skin_Level[cindex] = cskinlv
	-- skin_heroname[cindex] = cSkinName
	
	if cindex <= 10 then	
		if tonumber(cGold) == 998 then
			SKIN_LISTL_PRICE[cindex]:SetFontText( "限售", 0xa6fffe)
		else
			SKIN_LISTL_PRICE[cindex]:SetFontText( cGold, 0xa6fffe)
		end
		SKIN_LISTL_BUYGold[cindex].changeimage(SellTypeList[selltype])
		
		
		SKIN_LISTL_HOVER[cindex]:SetVisible(0)
		if cIsHave==1 then
			SKIN_LISTL_HIDE[cindex]:SetVisible(0)
		else
			SKIN_LISTL_HIDE[cindex]:SetVisible(1)
		end
		
		SKIN_LISTL_BTN[cindex]:SetVisible(1)
		-- if cheroid==122 and cSkinID==2
		-- or cheroid==142 and cSkinID==4
		-- or cheroid==196 and cSkinID==2
		-- or cheroid==193 and cSkinID==3
		-- or cheroid==137 and cSkinID==2
		-- or cheroid==165 and cSkinID==3
		-- or cheroid==163 and cSkinID==2 then 		
			-- SKIN_LISTL_BTN[cindex].changeimage("../UI/Icon/Skin/SkinCover/champion.BMP")
		-- else
			SKIN_LISTL_BTN[cindex].changeimage( ".."..cPath)
		-- end
		
		SwitchEffect:AddWnd(SKIN_LISTL_BTN[cindex])
		
		if IsCanSelSkin==0 then
			-- check is show
			local itemID=0
			if cSkinID==0 then
				itemID=cheroid
			else
				itemID=(60000 + cheroid * 10 + cSkinID - 1)
			end
			local isShow = 1
			local tempList = GetUnShowItemIdArray()
			for index = 1, #tempList do
				if tempList[index] == itemID then
					isShow = 0
					break
				end
			end
		
			if cIsHave ~= 1 and isShow == 1 then
				-- SKIN_LISTL_BUY[cindex]:SetVisible(1)
				-- if tonumber(cGold) == 999 then
					-- SKIN_LISTL_BUY:SetVisible(0)
				-- end
				
				-- if cheroid == 121 and cSkinID==3 then
					-- SKIN_LISTL_BUY:SetVisible(1)
					-- SKIN_LISTL_BUYGold:SetVisible(0)
					-- SKIN_LISTL_PRICE:SetFontText("预售",0xffffff)
				-- end
			end
		end		
		
		if cIsHave == 1 then
			m_IsHaveImage[cindex]:SetVisible(0)
		else
			m_IsHaveImage[cindex]:SetVisible(1)
		end
	end
	XTimeLimitSkinReq(heroid_skinframe)
end

-- clear
function ClearAll_skinframe()
	heroid_skinframe = 0
	skinimgpath_skinframe = {}
	IsHave = {}
	SkinID = {}
	Skin_Level = {}
	-- skin_heroname = {}
	SwitchEffect:RemoveAllWnd()
	
	for i,v in pairs(SKIN_LISTL_BTN) do
		SKIN_LISTL_BTN[i]:SetVisible(0)
		
		SKIN_LISTL_HIDE[i]:SetVisible(1)
		SKIN_LISTL_HOVER[i]:SetVisible(0)
		m_IsHaveImage[i]:SetVisible(0)
		CurSelSkin[i]:SetVisible(0)
		
	end
	
	for i,v in pairs(SKIN_LISTL_BUYGold) do
		SKIN_LISTL_BUYGold[i]:SetVisible(0)
	end
end


-- 选择皮肤
function SetCurSelSkin_skinframe(cSkinID, cIsbuy)
	if IsCanSelSkin == 1 then
		for i,v in pairs(SKIN_LISTL_BTN) do
			-- 先全部隐藏
			if cIsbuy == 1 then				
				if( SkinID[i] ~= nil and SkinID[i]==cSkinID)then
					log("\nSkinID[i]  = "..SkinID[i] )
					CurSelSkin[i]:SetVisible(1)
					SwitchEffect:MoveToTarget(i)
					SKIN_LISTL_BUYGold[i]:SetVisible(1)
				else
					CurSelSkin[i]:SetVisible(0)
				end			
			end
		end
				
		-- 超级皮肤上次使用的英雄皮肤
		if heroid_skinframe==168 and cSkinID>1 and cSkinID<9 and cIsbuy == 1 then
			CurSelSkin[3-CurPage]:SetVisible(1)
		end
		
	end
end

function SetCurSelSkinPage_skinframe(page)
	-- log("\npage = "..page)
end

function BuySuccessRefeshSkinState_skinframe()
	-- if MaxPage==1 then			
		-- local page = math.max(IndexPage,MinPage)
		-- page = math.min(page,MaxPage)
		XClickPageButton_SkinFrame(1)
	-- elseif MaxPage==2 then
		-- local page = math.max(IndexPage,MinPage)
		-- page = math.min(page,MaxPage)
		-- XClickPageButton_SkinFrame(page)
	-- elseif MaxPage>=3 then
		-- XClickPageButton_SkinFrame(IndexPage)
	-- end
end

function ClearPageIndex_skinframe()
	CurPage = 1
	IndexPage = 1
end

function SetSkinPageButtonVisible_skinframe( skinallcount )
	MaxPage = skinallcount
	-- if(skinallcount>3) then
		-- LeftPageButton:SetVisible(1)
		-- RightPageButton:SetVisible(1)
	-- else
		-- LeftPageButton:SetVisible(0)
		-- RightPageButton:SetVisible(0)
	-- end
	
	SwitchEffect:SetCenterIdx(1)
	SKIN_LISTL_BUYGold[1]:SetVisible(1)	
end

-- 限时皮肤
function TimeLimitSkinAck_SkinFrame( skinid, leaftimes)
	local skinindex = 1
	for i,v in pairs(SkinID) do
		if SkinID[i]== skinid then
			skinindex = i
			break
		end
	end
	
	if leaftimes == "" then
		TimeLimitSkin[skinindex]:SetVisible(0)
		m_IsHaveImage[skinindex]:SetVisible(1)
	else
		TimeLimitSkin[skinindex]:SetFontText( leaftimes, 0xff0000)
		TimeLimitSkin[skinindex]:SetVisible(1)
		m_IsHaveImage[skinindex]:SetVisible(0)
	end

end

function ClearAllSkinTimeLimitFont_SkinFrame()
	for index,value in pairs(TimeLimitSkin) do
		TimeLimitSkin[index]:SetVisible(0)
	end
end


function GameSkin_IsReady(ready)
	-- for i,v in pairs(SKIN_LISTL_BTN) do
		-- SKIN_LISTL_BTN[i]:SetEnabled(ready)		
	-- end
	
	-- LeftPageButton:SetEnabled(ready)
	-- RightPageButton:SetEnabled(ready)
end
--设置显示
function SetGameSkinFrameIsVisible(flag) 
	if g_game_SkinFrame_ui ~= nil then
		if flag == 1 and g_game_SkinFrame_ui:IsVisible() == false then
			g_game_SkinFrame_ui:CreateResource()
			g_game_SkinFrame_ui:SetVisible(1)
			ClearAll_skinframe()
			
			--XInGameLog("act=WINDOW,Function=SetGameSkinFrameIsVisible,visible=true")
		elseif flag == 0 and g_game_SkinFrame_ui:IsVisible() == true then
			g_game_SkinFrame_ui:DeleteResource()
			XNoUpdateSkinTimesLimit()
			g_game_SkinFrame_ui:SetVisible(0)			
			
			--XInGameLog("act=WINDOW,Function=SetGameSkinFrameIsVisible,visible=false")
		end
	end
end

function GetGameSkinFrameIsVisible()
	if ( g_game_SkinFrame_ui ~= nil and g_game_SkinFrame_ui:IsVisible() ) then
		return 1
	else
		return 0
	end
end