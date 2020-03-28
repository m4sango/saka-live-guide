import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/list/all_member_list.dart';
import 'package:saka_live_guide/model/saka_group.dart';
import 'package:saka_live_guide/service/member_service.dart';
import 'package:saka_live_guide/service/model/response/all_member.dart';

class MemberListScreen extends StatefulWidget {
  final SakaGroup _selectedGroup;

  MemberListScreen(this._selectedGroup);

  @override
  State createState() => MemberListScreenState(_selectedGroup);
}

class MemberListScreenState extends State<MemberListScreen> {
  final MemberService _memberService = new MemberService();

  final SakaGroup _selectedGroup;
  final SakaGroupHelper _selectedGroupHelper;

  MemberListScreenState(this._selectedGroup)
      : _selectedGroupHelper = SakaGroupHelper(_selectedGroup);

  @override
  Widget build(BuildContext context) {
    Future<AllMemberList> items = _createAllMemberList();

    return Scaffold(
      appBar: AppBar(
        title: Text("メンバー一覧"),
        backgroundColor: _selectedGroupHelper.getColor(),
      ),
      body: FutureBuilder<AllMemberList>(
        future: items,
        builder: (BuildContext context, AsyncSnapshot<AllMemberList> snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.error.toString());
            return Text("データの取得に失敗しました。");
          }
          AllMemberList items = snapshot.data;
          return ListView.builder(
            itemCount: items.allMemberList.length,
            itemBuilder: (context, index) {
              return items.allMemberList[index].createListTile(_selectedGroup);
            },
          );
        },
      ),
    );
  }

  Future<AllMemberList> _createAllMemberList() async {
    AllMember allMember = await _memberService.getAllMember(_selectedGroup);

    return AllMemberList(allMember);
  }
}
