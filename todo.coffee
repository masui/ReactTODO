# React.createClass で ReactのComponentというオブジェクトができる
# getInitialStateは初期化メソッド
# setStateでrenderが呼ばれるっぽい
#   というかこれでUI状態を更新するのが基本らしい
#   this.stateが設定される
# <TodoList items="xxx" /> で指定したものが TodoListのthis.propsでアクセスできる
#   this.propsは親要素が子供に渡す属性
#   引数みたいな感じで使うのかな[z]
                                (図表)(図)(図形)(絶対)(属性)(全国)(全然)(全部)(図面)(ざわ)
# 以下のも自動に呼ばれるようだ
#   componentDidMount 最初にrenderされたとき呼ばれる
#   componentWillUnmount
# <div id="abc"></div> というのがあるとgetElemntByIdしなくても abc という変数で使えるようだ

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
