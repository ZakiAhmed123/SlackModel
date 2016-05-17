var Form = React.createClass({

  theForm(event){
    event.preventDefault();
    var theText = this.refs.convo.value;
    var theJSON = {
      post: {
        text: theText
      }
    };

    fetch("/api/posts.json", {
      method: 'post',
      headers: {
        "Content-type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(theJSON)
    }).then(function(response){
      return response.json();
    }).then(function(data){
      component.refs.convo.value = "";
    })

  },

  render(){

  var inputstyle = {
  position: 'fixed',
  bottom: '10',
  left: '17.5%',
  zIndex: '9999',
  width: '80%',
  height: '40px',
  borderRadius: '8px',
  border: '2px solid gray',
  fontSize: '17px',
  fontFamily: 'Lato',
  }
    return <form onSubmit={this.theForm} class="send_message">

      <input style={inputstyle} type="text" ref="convo"/>
  </form>
  }
})
