import React from "react"
import PropTypes from "prop-types"
class Username extends React.Component {
  render () {
    return (
      <React.Fragment>
        Name: {this.props.name}
        Password: {this.props.password}
      </React.Fragment>
    );
  }
}

Username.propTypes = {
  name: PropTypes.string,
  password: PropTypes.string
};
export default Username
