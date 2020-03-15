import 'package:saka_live_guide/service/model/response/member.dart';

class AllMember {
  final List<List<Member>> allMember;

  AllMember(this.allMember);

  factory AllMember.fromJson(List<List<dynamic>> json) {
    List<List<Member>> dataList = new List<List<Member>>();
    dataList = json.map((list) {
      list.map((item) => Member.fromJson(item));
    }).cast<List<Member>>();

    return new AllMember(dataList);
  }
}
