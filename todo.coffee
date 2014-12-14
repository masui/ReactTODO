# getInitialStateは初期化メソッド
# setStateでrenderが呼ばれるっぽい

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

mountNode = $('#mountNode')[0]
React.render(<TodoApp />, mountNode)
