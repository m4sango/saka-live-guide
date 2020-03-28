import 'package:saka_live_guide/model/list/heading_item.dart';
import 'package:saka_live_guide/model/list/list_item.dart';
import 'package:saka_live_guide/model/list/member_item.dart';
import 'package:saka_live_guide/service/model/response/all_member.dart';

class AllMemberList {
  final List<ListItem> allMemberList;

  AllMemberList._(this.allMemberList);

  factory AllMemberList(AllMember allMember) {
    List<ListItem> list = new List();

    for (int count = 1; count <= allMember.allMember.length; count++) {
      list.add(HeadingItem(count));

      allMember.allMember[count - 1].forEach((member) {
        list.add(MemberItem(member));
      });
    }

    return new AllMemberList._(list);
  }
}
