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

  prevPage(e){
    e.preventDefault()
    this.setState({page: this.state.page-1})
  },

  nextPage(e){
    e.preventDefault()
    this.setState({page: this.state.page+1})
  },



  render: function() {
    var page = this.state.page,
        size = this.state.pageSize,
        posts = this.state.posts,
        prevLink = <a href="#" onClick={this.prevPage}>prev</a>,
        nextLink = <a href="#" onClick={this.nextPage}>next</a>,
        maxPage = Math.ceil(posts.length / size) - 1

    var divstyle = {
    margin: '50px 0px 0px 30px',
    }

    var namestyle = {
    fontFamily: 'Lato',
    fontSize: '17px',
    }

    return <div style={divstyle}>
      {posts.slice(page*size, (page+1)*size).map(function(post){
        return <p style={namestyle} key={post.id}>{post.user.first_name} {post.text}</p>
      })}

      <div>
        {page !==0 ? prevLink : ''}

        {page === maxPage ? '' : nextLink}
      </div>

    </div>;
  }
});
