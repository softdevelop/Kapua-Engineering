import 'react-sortable-tree/style.css';
import React, { Component } from 'react';
import SortableTree, { getFlatDataFromTree } from 'react-sortable-tree';
import { APIURL } from '../constants/Constants';
import axios from 'axios';


export default class Tree extends Component {
  constructor(props) {
    super(props);

    this.state = {
      searchString: '',
      searchFocusIndex: 0,
      searchFoundCount: null,
      treeData: [],
    };
  };

  componentWillReceiveProps(props) {
    this.setState({
      treeData: props.treeData,
    });
  }

  changeData = () => {
    const list = getFlatDataFromTree({
      treeData: this.state.treeData,
      getNodeKey: ({ node }) => node.id,
      ignoreCollapsed: false,
    }).map(({ node, path }) => ({
      id: node.id,
      name: node.name,
      parent: path.length > 1 ? path[path.length - 2] : null,
    }));
    
    axios.post(`${APIURL}list-node-update/`, { list })
      .then(res => {
        console.log('success!!!');
      })
      .catch(error => {
        console.log('Error fetching and parsing data', error);
      });
  }

  render() {
    const { searchString, searchFocusIndex, searchFoundCount } = this.state;
    const customSearchMethod = ({ node, searchQuery }) =>
      searchQuery &&
      node.title.toLowerCase().indexOf(searchQuery.toLowerCase()) > -1;

    const selectPrevMatch = () =>
      this.setState({
        searchFocusIndex:
          searchFocusIndex !== null
            ? (searchFoundCount + searchFocusIndex - 1) % searchFoundCount
            : searchFoundCount - 1,
      });

    const selectNextMatch = () =>
      this.setState({
        searchFocusIndex:
          searchFocusIndex !== null
            ? (searchFocusIndex + 1) % searchFoundCount
            : 0,
      });

    return (
      <div>
        <h2>SortableTree!</h2>
        <form 
          className="form-group"
          style={{ display: 'inline-flex' }}
          onSubmit={event => {
            event.preventDefault();
          }}
        >
          <input
            className="form-control"
            id="find-box"
            type="text"
            placeholder="Search..."
            style={{ fontSize: '1rem' , marginRight: '10px'}}
            value={searchString}
            onChange={event =>
              this.setState({ searchString: event.target.value })
            }
          />

          <button
            className="btn btn-info"
            style={{ marginRight: '10px'}}
            type="button"
            disabled={!searchFoundCount}
            onClick={selectPrevMatch}
          >
            &lt;
          </button>

          <button
            className="btn btn-info"
            type="submit"
            disabled={!searchFoundCount}
            onClick={selectNextMatch}
          >
            &gt;
          </button>

          <span>
            &nbsp;
            {searchFoundCount > 0 ? searchFocusIndex + 1 : 0}
            &nbsp;/&nbsp;
            {searchFoundCount || 0}
          </span>
        </form>

        <div style={{ height: 500 }}>
          <SortableTree
            treeData={this.state.treeData}
            onChange={treeData => this.setState({treeData})}
            onMoveNode={this.changeData}
            searchMethod={customSearchMethod}

            searchQuery={searchString}

            searchFocusOffset={searchFocusIndex}

            searchFinishCallback={matches =>
              this.setState({
                searchFoundCount: matches.length,
                searchFocusIndex:
                  matches.length > 0 ? searchFocusIndex % matches.length : 0,
              })
            }
          />
        </div>
      </div>
    );
  }
}
