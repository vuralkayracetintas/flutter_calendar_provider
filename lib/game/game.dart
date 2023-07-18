import 'package:demo_apps/game/model.dart';
import 'package:demo_apps/game/utils.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final _BoardWidgetState state;

  const MyHomePage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    Size boardSize = state.boardSize();
    double width = (boardSize.width - (state.column + 1) * state.tilePadding) /
        state.column;

    List<TileBox> backgroundBox = <TileBox>[];
    for (int r = 0; r < state.row; ++r) {
      for (int c = 0; c < state.column; ++c) {
        TileBox tile = TileBox(
          left: c * width * state.tilePadding * (c + 1),
          top: r * width * state.tilePadding * (r + 1),
          size: width,
          color: Colors.transparent,
          text: const Text(''),
        );
        backgroundBox.add(tile);
      }
    }

    return Positioned(
      left: 0.0,
      top: 0.0,
      child: Container(
        width: state.boardSize().width,
        height: state.boardSize().width,
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(6.0)),
        child: Stack(
          children: backgroundBox,
        ),
      ),
    );
  }
}

class BoardWidget extends StatefulWidget {
  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  late Board _board;
  late int row;
  late int column;
  late bool _isMoving;
  late bool gameOver;
  late double tilePadding = 5.0;
  late MediaQueryData _queryData;

  @override
  void initState() {
    super.initState();

    row = 4;
    column = 4;
    _isMoving = false;
    gameOver = false;

    _board = Board(row, column);
    newGame();
  }

  void newGame() {
    setState(() {
      _board.initBoard();
      gameOver = false;
    });
  }

  void gameover() {
    setState(() {
      if (_board.gameOver()) {
        gameOver = true;
      }
    });
  }

  Size boardSize() {
    Size size = _queryData.size;
    return Size(size.width, size.width);
  }

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    List<TileWidget> _tileWidgets = <TileWidget>[];
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        _tileWidgets.add(TileWidget(tile: _board.getTile(r, c), state: this));
      }
    }
    List<Widget> children = <Widget>[];

    children.add(MyHomePage(state: this));
    children.addAll(_tileWidgets);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.deepPurple),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "E-LooPsAkademi YKS OYUN",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[50],
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text("Score: "),
                          //Text("${_board.score}"),
                          Text(
                            "SKOR \n${_board.score} ",
                            textAlign: TextAlign.center,
                          )
                        ],
                      )),
                    ),
                    // ElevatedButton(
                    //   child: Container(
                    //     width: 120.0,
                    //     height: 60.0,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey),
                    //         color: Colors.orange[100]),
                    //     child: const Center(
                    //       child: Text("New Game"),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     newGame();
                    //   },
                    // ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: Colors.white,
                          minimumSize: const Size(120, 40),
                        ),
                        onPressed: () {
                          newGame();
                        },
                        child: const Text(
                          "Yeni Oyun",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
                SizedBox(
                    height: 40.0,
                    child: Opacity(
                      opacity: gameOver ? 1.0 : 0.0,
                      child: const Center(
                        child: Text('Game Over'),
                      ),
                    )),
                SizedBox(
                  width: _queryData.size.width,
                  height: _queryData.size.width,
                  child: GestureDetector(
                    onVerticalDragUpdate: (detail) {
                      if (detail.delta.distance == 0 || _isMoving) {
                        return;
                      }
                      _isMoving = true;
                      if (detail.delta.direction > 0) {
                        setState(() {
                          _board.moveDown();
                          gameover();
                        });
                      } else {
                        setState(() {
                          _board.moveUp();
                          gameover();
                        });
                      }
                    },
                    onVerticalDragEnd: (d) {
                      _isMoving = false;
                    },
                    onVerticalDragCancel: () {
                      _isMoving = false;
                    },
                    onHorizontalDragUpdate: (d) {
                      if (d.delta.distance == 0 || _isMoving) {
                        return;
                      }
                      _isMoving = true;
                      if (d.delta.direction > 0) {
                        setState(() {
                          _board.moveLeft();
                          gameover();
                        });
                      } else {
                        setState(() {
                          _board.moveRight();
                          gameover();
                        });
                      }
                    },
                    onHorizontalDragEnd: (d) {
                      _isMoving = false;
                    },
                    onHorizontalDragCancel: () {
                      _isMoving = false;
                    },
                    child: Stack(
                      children: children,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class TileWidget extends StatefulWidget {
  final Tile tile;
  final _BoardWidgetState state;

  const TileWidget({Key? key, required this.tile, required this.state})
      : super(key: key);
  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    widget.tile.isNew = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tile.isNew && !widget.tile.isEmpty()) {
      controller.reset();
      controller.forward();
      widget.tile.isNew = false;
    } else {
      controller.animateTo(1.0);
    }

    return AnimatedTileWidget(
      tile: widget.tile,
      state: widget.state,
      animation: animation,
    );
  }
}

class AnimatedTileWidget extends AnimatedWidget {
  final Tile tile;
  final _BoardWidgetState state;

  AnimatedTileWidget({
    Key? key,
    required this.tile,
    required this.state,
    required Animation<double> animation,
  }) : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    double animationValue = animation.value;
    Size boardSize = state.boardSize();
    double width = (boardSize.width - (state.column + 1) * state.tilePadding) /
        state.column;

    if (tile.value == 0) {
      return Container();
    } else {
      return TileBox(
        left: (tile.column * width + state.tilePadding * (tile.column + 1)) +
            width / 2 * (1 - animationValue),
        top: tile.row * width +
            state.tilePadding * (tile.row + 1) +
            width / 2 * (1 - animationValue),
        size: width * animationValue,
        color: getColor,
        text: Text('${tile.value}'),
      );
    }
  }

  get getColor => tileColors.containsKey(tile.value)
      ? tileColors[tile.value]
      : Colors.yellow;
}

class TileBox extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Color color;
  final Text text;

  const TileBox({
    Key? key,
    required this.left,
    required this.top,
    required this.size,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
