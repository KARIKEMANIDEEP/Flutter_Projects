class DashboardModel{
  final int? sno;
  final String? doctorCode;
  final String? doctorName;
  final String? apmtDt;
  final int? bookedCnt;
  final int? completedCnt;
  final int? totalApmntCnt;
  final String? todayApmntMsg;
  final String? nextApmntDt;
  final int? nextDayBookedCnt;
  final String? nextDayApmntMsg;
  final int? todayOnBedCnt;
  final int? todayDschrgCnt;
  final int? todayErCnt;
  final int? totalAdmnCnt;
  final int? ipCriticalAlert;
  final int? opCriticalAlert;
  final int? opReferralCnt;
  final int? ipReferralCnt;
  DashboardModel({
    this.sno,
    this.doctorCode,
    this.doctorName,
    this.apmtDt,
    this.bookedCnt,
    this.completedCnt,
    this.totalApmntCnt,
    this.todayApmntMsg,
    this.nextApmntDt,
    this.nextDayBookedCnt,
    this.nextDayApmntMsg,
    this.todayOnBedCnt,
    this.todayDschrgCnt,
    this.todayErCnt,
    this.totalAdmnCnt,
    this.ipCriticalAlert,
    this.opCriticalAlert,
    this.opReferralCnt,
    this.ipReferralCnt,
});
  factory DashboardModel.fromJson({required Map<String, dynamic>json}){
    return DashboardModel(
      sno: json["SNO"],
      doctorCode: json["DOCTOR_CD"],
      doctorName: json["DOCTOR_NAME"],
      apmtDt: json["APMNT_DT"],
      bookedCnt: json["BOOKED_CNT"],
      completedCnt: json["COMPLETED_CNT"],
      totalApmntCnt: json["TOTAL_APMNT_CNT"],
      todayApmntMsg: json["TODAY_APMNT_MSG"],
      nextApmntDt: json["NEXT_APMNT_DT"],
      nextDayBookedCnt: json["NEXT_DAY_BOOKED_CNT"],
      nextDayApmntMsg: json["NEXT_DAY_APMNT_MSG"],
      todayOnBedCnt: json["TODAY_ON_BED_CNT"],
      todayDschrgCnt: json["TODAY_DSCHRG_CNT"],
      todayErCnt: json["TODAY_ER_CNT"],
      totalAdmnCnt: json["TOTAL_ADMN_CNT"],
      ipCriticalAlert: json["IP_CRITICAL_ALERT"],
      opCriticalAlert: json["OP_CRITICAL_ALERT"],
      opReferralCnt: json["OP_REFERRAL_CNT"],
      ipReferralCnt: json["IP_REFERRAL_CNT"],
    );
  }
  Map<String, dynamic>toJson(){
      return {
        "SNO": sno,
        "DOCTOR_CD": doctorCode,
        "DOCTOR_NAME": doctorName,
        "APMNT_DT": apmtDt,
        "BOOKED_CNT": bookedCnt,
        "COMPLETED_CNT": completedCnt,
        "TOTAL_APMNT_CNT": totalApmntCnt,
        "TODAY_APMNT_MSG": todayApmntMsg,
        "NEXT_APMNT_DT": nextApmntDt,
        "NEXT_DAY_BOOKED_CNT": nextDayBookedCnt,
        "NEXT_DAY_APMNT_MSG": nextDayApmntMsg,
        "TODAY_ON_BED_CNT": todayOnBedCnt,
        "TODAY_DSCHRG_CNT": todayDschrgCnt,
        "TODAY_ER_CNT": todayErCnt,
        "TOTAL_ADMN_CNT": totalAdmnCnt,
        "IP_CRITICAL_ALERT": ipCriticalAlert,
        "OP_CRITICAL_ALERT": opCriticalAlert,
        "OP_REFERRAL_CNT": opReferralCnt,
        "IP_REFERRAL_CNT": ipReferralCnt,
      };
  }


}