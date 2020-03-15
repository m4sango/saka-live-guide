import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';

class SelectMenuScreen extends StatelessWidget {
  final SakaGroup _selectedGroup;
  SakaGroupHelper _selectedGroupHelper;

  SelectMenuScreen(this._selectedGroup) {
    _selectedGroupHelper = SakaGroupHelper(_selectedGroup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メニュー"),
        backgroundColor: _selectedGroupHelper.getColor(),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                GridTile(
                  child: InkResponse(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "メンバー",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: _selectedGroupHelper.getColor(),
                        ),
                      ),
                      color: Colors.green[100],
                      alignment: Alignment.center,
                    ),
                    // TODO: onTapアクション実装
                    onTap: () => {print('on tped')},
                  ),
                ),
                GridTile(
                  child: InkResponse(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "楽曲",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: _selectedGroupHelper.getColor(),
                        ),
                      ),
                      color: Colors.green[100],
                      alignment: Alignment.center,
                    ),
                    // TODO: onTapアクション実装
                    onTap: () => {print('on tped')},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
