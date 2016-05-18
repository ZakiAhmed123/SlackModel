var Posts = React.createClass({

  fetchPostsTimer: null,

  getInitialState(){
    return {
      posts: [],
      pageSize: 10,
      page: 0,
    }
  },

  fetchPosts(){
    var component = this;
    fetch("/api/posts.json", {credentials: 'include'})
      .then(function(response){
        return response.json();
      })
      .then(function(json){
        component.setState({
          posts: json.posts
        })
      })
  },

  componentDidMount(){
    this.fetchPosts();
    this.fetchPostsTimer = setInterval(this.fetchPosts, 3000);
  },

  componentWillUnmount(){
    clearInterval(this.fetchPostsTimer);
  },


  render: function() {
    var page = this.state.page,
        size = this.state.pageSize,
        posts = this.state.posts

    var divstyle = {
    margin: '50px 0px 0px 30px',
    }

    var namestyle = {
    fontFamily: 'Lato',
    fontSize: '17px',
    }

    return <div style={divstyle}>
      {posts.slice(page*size, (page+1)*size).map(function(post){
        return <p style={namestyle} key={post.id}> <img src={post.user.user_photo_url}/> {post.timestamp} {post.user.first_name} {post.user.last_name} said: {post.text}
        </p>
      })}


    </div>;
  }
});
