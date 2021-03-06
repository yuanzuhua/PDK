#ifndef ATTEMPER_ENGINE_SINK_HEAD_FILE
#define ATTEMPER_ENGINE_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "InitParameter.h"
#include "ServerListManager.h"

//////////////////////////////////////////////////////////////////////////////////
//数据定义

//连接类型
#define CLIENT_KIND_FALSH			1									//网页类型
#define CLIENT_KIND_MOBILE			2									//手机类型
#define CLIENT_KIND_COMPUTER		3									//电脑类型

//绑定参数
struct tagBindParameter
{
	//网络参数
	DWORD							dwSocketID;							//网络标识
	DWORD							dwClientAddr;						//连接地址
	DWORD							dwActiveTime;						//激活时间

	//连接信息
	WORD							wModuleID;							//模块标识
	BYTE							cbClientKind;						//连接类型
	DWORD							dwPlazaVersion;						//大厅版本
};

//低保参数
struct tagBaseEnsureParameter
{
	SCORE							lScoreCondition;					//游戏币条件
	SCORE							lScoreAmount;						//游戏币数量
	BYTE							cbTakeTimes;						//领取次数	
};

//////////////////////////////////////////////////////////////////////////////////

//调度钩子
class CAttemperEngineSink : public IAttemperEngineSink
{
	//友元定义
	friend class CServiceUnits;

	//状态变量
protected:
	bool							m_bNeekCorrespond;					//协调标志
	bool                            m_bShowServerStatus;                //显示服务器状态

	//变量定义
protected:
	CInitParameter *				m_pInitParameter;					//配置参数
	tagBindParameter *				m_pBindParameter;					//辅助数组

	//组件变量
protected:
	CServerListManager				m_ServerListManager;				//列表管理
	CMD_GP_CheckInInfo				m_kCheckInInfo;						//签到奖励
	CMD_GP_BeginnerInfo				m_kBeginnerInfo;					//新手活动
	CMD_GP_BackAddBankAwardInfo		m_BackAddBankAwardInfo;				//赚金榜奖励	
	CMD_GP_BackRouletteUeserInfo	m_kBackRouletteUeserInfo;			//轮盘奖励
	tagBaseEnsureParameter			m_BaseEnsureParameter;				//低保参数	
	tagGameConfig					m_kGameConfig;						//游戏参数
	//组件接口
protected:
	ITimerEngine *					m_pITimerEngine;					//时间引擎
	IDataBaseEngine *				m_pIDataBaseEngine;					//数据引擎
	ITCPNetworkEngine *				m_pITCPNetworkEngine;				//网络引擎
	ITCPSocketService *				m_pITCPSocketService;				//协调服务

	//视频配置
protected:
	WORD							m_wAVServerPort;					//视频端口
	DWORD							m_dwAVServerAddr;					//视频地址

	//函数定义
public:
	//构造函数
	CAttemperEngineSink();
	//析构函数
	virtual ~CAttemperEngineSink();

	//基础接口
public:
	//释放对象
	virtual VOID Release() { return; }
	//接口查询
	virtual VOID * QueryInterface(REFGUID Guid, DWORD dwQueryVer);

	//异步接口
public:
	//启动事件
	virtual bool OnAttemperEngineStart(IUnknownEx * pIUnknownEx);
	//停止事件
	virtual bool OnAttemperEngineConclude(IUnknownEx * pIUnknownEx);

	//事件接口
public:
	//控制事件
	virtual bool OnEventControl(WORD wIdentifier, VOID * pData, WORD wDataSize);
	//自定事件
	virtual bool OnEventAttemperData(WORD wRequestID, VOID * pData, WORD wDataSize);

	//内核事件
public:
	//时间事件
	virtual bool OnEventTimer(DWORD dwTimerID, WPARAM wBindParam);
	//数据库事件
	virtual bool OnEventDataBase(WORD wRequestID, DWORD dwContextID, VOID * pData, WORD wDataSize);

	//连接事件
public:
	//连接事件
	virtual bool OnEventTCPSocketLink(WORD wServiceID, INT nErrorCode);
	//关闭事件
	virtual bool OnEventTCPSocketShut(WORD wServiceID, BYTE cbShutReason);
	//读取事件
	virtual bool OnEventTCPSocketRead(WORD wServiceID, TCP_Command Command, VOID * pData, WORD wDataSize);

	//网络事件
public:
	//应答事件
	virtual bool OnEventTCPNetworkBind(DWORD dwClientAddr, DWORD dwSocketID);
	//关闭事件
	virtual bool OnEventTCPNetworkShut(DWORD dwClientAddr, DWORD dwActiveTime, DWORD dwSocketID);
	//读取事件
	virtual bool OnEventTCPNetworkRead(TCP_Command Command, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//连接处理
protected:
	//注册事件
	bool OnTCPSocketMainRegister(WORD wSubCmdID, VOID * pData, WORD wDataSize);
	//服务信息
	bool OnTCPSocketMainServiceInfo(WORD wSubCmdID, VOID * pData, WORD wDataSize);
	//远程服务
	bool OnTCPSocketMainRemoteService(WORD wSubCmdID, VOID * pData, WORD wDataSize);

	//网络事件
protected:
	//登录处理
	bool OnTCPNetworkMainPCLogon(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//列表处理
	bool OnTCPNetworkMainPCServerList(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//服务处理
	bool OnTCPNetworkMainPCUserService(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//远程处理
	bool OnTCPNetworkMainPCRemoteService(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//手机事件
protected:
	//登录处理
	bool OnTCPNetworkMainMBLogon(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//列表处理
	bool OnTCPNetworkMainMBServerList(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//网络事件
protected:
	//I D 登录
	bool OnTCPNetworkSubPCLogonGameID(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//帐号登录
	bool OnTCPNetworkSubPCLogonAccounts(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//帐号注册
	bool OnTCPNetworkSubPCRegisterAccounts(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//游客登录
	bool OnTCPNetworkSubPCVisitor(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	
	//手机事件
protected:
	//I D 登录
	bool OnTCPNetworkSubMBLogonGameID(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//帐号登录
	bool OnTCPNetworkSubMBLogonAccounts(VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//帐号注册
	bool OnTCPNetworkSubMBRegisterAccounts(VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//游戏事件
protected:
	//登录成功
	bool OnDBPCLogonSuccess(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//登录失败
	bool OnDBPCLogonFailure(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//登录失败
	bool OnDBPCLogonValidateMBCard(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//用户头像
	bool OnDBPCUserFaceInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//用户信息
	bool OnDBPCUserIndividual(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//用户个人信息
	bool OnDBPCUserAccountInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//银行信息
	bool OnDBPCUserInsureInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//银行成功
	bool OnDBPCUserInsureSuccess(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//银行失败
	bool OnDBPCUserInsureFailure(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//用户信息
	bool OnDBPCUserInsureUserInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//自定义数据查询
	bool OnDBPCPublicNotice(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏状态
	bool OnDBPCInGameSevrerID(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//设置推荐人结果
	bool OnDBPCOSpreaderResoult(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//操作成功
	bool OnDBPCOperateSuccess(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//操作失败
	bool OnDBPCOperateFailure(DWORD dwContextID, VOID * pData, WORD wDataSize);

	VOID SendUserSignupInfo(DWORD dwSocketID,WORD wSignupCount,tagSignupMatchInfo * pSignupMatchInfo);

	VOID SendOperateFailure(DWORD dwContextID, LONG lResultCode, LPCTSTR pszDescribe);

public:
	//报名结果
	bool OnDBPCUserMatchSignupResult(DWORD dwContextID, VOID * pData, WORD wDataSize);
	// 比赛奖励
	bool OnDBPCMacthAwardList( DWORD dwContextID, VOID * pData, WORD wDataSize );

	//手机事件
protected:
	//登录成功
	bool OnDBMBLogonSuccess(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//登录失败
	bool OnDBMBLogonFailure(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//列表事件
protected:
	//游戏种类
	bool OnDBPCGameTypeItem(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏类型
	bool OnDBPCGameKindItem(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏节点
	bool OnDBPCGameNodeItem(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏定制
	bool OnDBPCGamePageItem(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏列表
	bool OnDBPCGameListResult(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//签到奖励
	bool OnDBPCCheckInReward(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//签到信息
	bool OnDBPCUserCheckInInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//签到结果
	bool OnDBPCUserCheckInResult(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//新手引导奖励
	bool OnDBPCBeginnerConfig(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//新手信息
	bool OnDBPCUserBeginnerInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//新手引导结果
	bool OnDBPCUserBeginnerResult(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//轮盘奖励加载
	bool OnDBPCUserRouletteAward(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//轮盘玩家信息
	bool OnDBPCUserRouletteUserInfo(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//游戏配置
	bool OnDBPCGameConfig(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//赚金榜奖励
	bool OnDBPCAddBankAwardConfig(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//赚金榜排行
	bool OnDBPCAddBankBack(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//低保参数
	bool OnDBPCBaseEnsureParameter(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//低保结果
	bool OnDBPCBaseEnsureResult(DWORD dwContextID, VOID * pData, WORD wDataSize);
	
	//兑换话费列表
	bool OnDBPCExchangeHuaFeiBack(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//商城列表
	bool OnDBPCShopInfoBack(DWORD dwContextID, VOID * pData, WORD wDataSize);

	//游戏记录
	bool OnDBPCGameRecordList(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏记录
	bool OnDBPCGameRecordTotal(DWORD dwContextID, VOID * pData, WORD wDataSize);
	//游戏记录
	bool OnDBPCGameRecordChild(DWORD dwContextID, VOID * pData, WORD wDataSize);
	
	//签到服务
protected:
	//查询签到
	bool OnTCPNetworkSubPCCheckinQuery(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//执行签到
	bool OnTCPNetworkSubPCCheckInDone(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//签到奖励
	bool OnTCPNetworkSubPCCheckAward(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//低保
	bool OnTCPNetworkSubPCBaseensureLoad(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	bool OnTCPNetworkSubPCBaseensureTake(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//轮盘服务
protected:
	
	//轮盘信息
	bool OnTCPNetworkSubPCRouletteUserInfo(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//执行轮盘
	bool OnTCPNetworkSubPCRouletteDone(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//新手活动
protected:
	//查询新手活动
	bool OnTCPNetworkSubPCBiggerQuery(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//执行新手活动
	bool OnTCPNetworkSubPCBiggerAward(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//赚金榜
protected:
	//赚金榜排行
	bool OnTCPNetworkSubGetAddBank(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	bool OnTCPNetworkSubAddBankAwardInfo(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//兑换话费
protected:
	//兑换话费列表
	bool  OnTCPNetworkSubGetExchangeHuaFei(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//兑换
	bool  OnTCPNetworkSubExchangeDone(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	
	//商城
protected:
	//商城列表
	bool  OnTCPNetworkSubGetShopInfo(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);
	//购买
	bool  OnTCPNetworkSubBuyOder(WORD wSubCmdID, VOID * pData, WORD wDataSize, DWORD dwSocketID);

	//辅助函数
protected:
	//版本检测
	bool CheckPlazaVersion(BYTE cbDeviceType, DWORD dwPlazaVersion, DWORD dwSocketID, bool bCheckLowVer=true);
	//发送请求
	bool SendUIControlPacket(WORD wRequestID, VOID * pData, WORD wDataSize);

	//发送列表
protected:
	//发送类型
	VOID SendGameTypeInfo(DWORD dwSocketID);
	//发送种类
	VOID SendGameKindInfo(DWORD dwSocketID);
	//发送节点
	VOID SendGameNodeInfo(DWORD dwSocketID, WORD wKindID);
	//发送定制
	VOID SendGamePageInfo(DWORD dwSocketID, WORD wKindID);
	//发送房间
	VOID SendGameServerInfo(DWORD dwSocketID, WORD wKindID);

	//手机列表
protected:
	//发送类型
	VOID SendMobileKindInfo(DWORD dwSocketID, WORD wModuleID);
	//发送房间
	VOID SendMobileServerInfo(DWORD dwSocketID, WORD wModuleID);

};

//////////////////////////////////////////////////////////////////////////////////

#endif