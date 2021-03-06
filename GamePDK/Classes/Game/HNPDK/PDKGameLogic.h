#ifndef PDKGAMELOGIC_H
#define PDKGAMELOGIC_H

#pragma once

#include "CMD_PDK.h"
#include "Game/Game/GameDefine.h"
#include "Game/FV/FvSingleton.h"

//////////////////////////////////////////////////////////////////////////
//宏定义

//数值掩码
#define	LOGIC_MASK_COLOR			0xF0

#pragma once

//////////////////////////////////////////////////////////////////////////

//扑克类型
#define CT_ERROR					0									//错误类型
#define CT_SINGLE					1									//单牌类型
#define CT_SINGLE_LINE				2									//单连类型
#define CT_DOUBLE_LINE				3									//对连类型
#define CT_THREE_LINE				4									//三连类型
#define CT_THREE_LINE_TAKE_SINGLE	     5									//三带一单
#define CT_THREE_LINE_TAKE_DOUBLE	     6									//三带一对
#define CT_BOMB					7									//炸弹类型
#define CT_FOUR_LINE_TAKE_THREE		8									//四带三类型

//宏定义
#define MAX_COUNT					16									//最大数目

//数值掩码
#define	LOGIC_MASK_COLOR			0xF0								//花色掩码
#define	LOGIC_MASK_VALUE			0x0F								//数值掩码

//分析结构
struct tagAnalyseResult
{
	BYTE 							bFourCount;							//四张数目
	BYTE 							bThreeCount;						//三张数目
	BYTE 							bDoubleCount;						//两张数目
	BYTE							bSignedCount;						//单张数目
	BYTE 							bFourLogicVolue[4];					//四张列表
	BYTE 							bThreeLogicVolue[5];				//三张列表
	BYTE 							bDoubleLogicVolue[8];				//两张列表
	BYTE 							bSignedLogicVolue[16];				//单张列表
	BYTE							bFourCardData[MAX_COUNT];			//四张列表
	BYTE							bThreeCardData[MAX_COUNT];			//三张列表
	BYTE							bDoubleCardData[MAX_COUNT];			//两张列表
	BYTE							bSignedCardData[MAX_COUNT];			//单张数目
};



//////////////////////////////////////////////////////////////////////////

//游戏逻辑类
class PDKGameLogic:public FvSingleton<PDKGameLogic>
{
	//变量定义
protected:
	static const BYTE				m_cbCardListData[48];				//扑克数据

	//函数定义
public:
	//构造函数
	PDKGameLogic();
	//析构函数
	virtual ~PDKGameLogic();

	//类型函数
public:
	//获取类型
	BYTE GetCardType(BYTE bCardData[], BYTE bCardCount);
	//获取类型
	BYTE GetCardType(const std::vector<BYTE>& cbCardList);
	//获取数值
	BYTE GetCardValue(BYTE bCardData) { return bCardData&LOGIC_MASK_VALUE; }
	//获取花色
	BYTE GetCardColor(BYTE bCardData) { return (bCardData&LOGIC_MASK_COLOR)>>4; }

	//控制函数
public:
	//排列扑克
	void SortCardList(BYTE bCardData[], BYTE bCardCount);
	void SortCardList(std::vector<BYTE>& cbCardList);
	//混乱扑克
	void RandCardList(BYTE bCardBuffer[], BYTE bBufferCount);
	//混乱扑克
	void RandCardList(std::vector<BYTE>& cbCardList);
	//删除扑克
	bool RemoveCard(const BYTE bRemoveCard[], BYTE bRemoveCount, BYTE bCardData[], BYTE bCardCount);

	//删除扑克
	bool RemoveCard(const std::vector<BYTE>& kRemoveCardList, std::vector<BYTE>& kCardList);

	//逻辑函数
public:
	//有效判断
	bool IsValidCard(BYTE cbCardData);
	//逻辑数值
	BYTE GetCardLogicValue(BYTE bCardData);

	//功能函数
public:
	//对比扑克
	bool CompareCard(BYTE bFirstList[], BYTE bNextList[], BYTE bFirstCount, BYTE bNextCount);
	//对比扑克
	bool CompareCard(const std::vector<BYTE>& kFirstList , const std::vector<BYTE>& kNextList);
	//分析扑克
	void AnalysebCardData(const BYTE bCardData[], BYTE bCardCount, tagAnalyseResult & AnalyseResult);

	//分析扑克
	void AnalysebCardData(const std::vector<BYTE>& cbCardList, tagAnalyseResult & AnalyseResult);

	//出牌判断
	bool SearchOutCard(BYTE bCardData[], BYTE bCardCount, BYTE bTurnCardData[], BYTE bTurnCardCount, BYTE bTurnOutType, tagOutCardResult & OutCardResultList);

	//出牌判断
	bool SearchOutCard(const std::vector<BYTE>& cbCardList, const std::vector<BYTE>& cbTurnCardList, BYTE bTurnOutType, std::vector<tagOutCardResult> & OutCardResultList);
};

//////////////////////////////////////////////////////////////////////////
#endif	
