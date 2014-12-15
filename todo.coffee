# * React.createClass で Reactの「Component」というオブジェクトができる
#   - Componentを並べるとHTMLができる
#   - 生のHTMLテキストを*.htmlに書く必要がないかも
# * Component
#   - renderというメソッドが必要
#   -  CompogetInitialStateは初期化メソッド
#   - Componentはstatという状態変数を持っている
#   - setStateでthis.stateの状態を変えるとrenderが呼ばれる
#     というかこれでUI状態を更新するのが基本
#     このあたりがReactiveというのかしらん
#   - 親から渡された属性はthis.propに入る
#   - 以下のようなメソッドも定義されている
#    - componentDidMount 最初にrenderされたとき呼ばれる
#    - componentWillUnmount
# * JSX
#   - タグで始まるとReact.createElement("ul",...) に変換される
#   - <TodoList items="xxx" />のように子供Componentを指定できる
#     -  TodoListのthis.propsでアクセスできる
#     -  this.propsは親要素が子供に渡す属性
#        引数みたいな感じで使うぽい
# * その他
#   - HTMLに<div id="abc"></div> というのがあるとgetElemntByIdしなくても abc という変数で使えるようだ
#   - CJSXというのでCoffeScriptを変換している
#     https://github.com/jsdf/coffee-react
#   - <div class="xx"> じゃなくて <div className="xx">と書くらしい
#   - 子供から親を呼ぶとき
#     [[http://gyazo.com/9f19424a1c95fd1508e37227853c2228.png]]
# * 参考資料
#   https://speakerdeck.com/koba04/get-started-react-dot-js

TodoList = React.createClass
  render: ->
    createItem = (itemText) ->
      <li>{itemText}</li>
    <ul>{this.props.items.map(createItem)}</ul>

TodoApp = React.createClass
  getInitialState: ->
    items: []   # this.state.items
    text: ''
  onChange: (e) ->
    this.setState            # ここでrenderが呼ばれる
      text: e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    this.state.items.push this.state.text
    this.setState
      items: this.state.items
      text: ''
  render: ->
    <div>
      <h3>TODO</h3>
      <TodoList items={this.state.items} />
      <form onSubmit={this.handleSubmit}>
        <input onChange={this.onChange} value={this.state.text} />
        <button>{'Add #' + (this.state.items.length + 1)}</button>
      </form>
    </div>

# tododiv = $('#tododiv')[0] が必要ない

$ ->
  React.render <TodoApp />, tododiv
