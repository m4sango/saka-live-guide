import 'package:saka_live_guide/service/model/response/member.dart';

class AllMember {
  final List<List<Member>> allMember;

  AllMember._internal(this.allMember);

  factory AllMember.fromJson(List jsonList) {
    List<List<Member>> dataList = new List<List<Member>>();

    jsonList.forEach((list) {
      List<Member> memberList = new List();

      list.forEach((member) {
        memberList.add(Member.fromJson(member));
      });

      dataList.add(memberList);
    });

    return AllMember._internal(dataList);
  }
}
