var React    = require('react');
var ReactDOM = require('react-dom');
import {Page, Card, Button, Layout, FormLayout, TextField, Banner, Heading, ResourceList, TextStyle, DatePicker, Collapsible} from '@shopify/polaris';

ReactDOM.render(
  <Heading>Admin APIs</Heading>,
  document.getElementById('admin-api-heading')
);

ReactDOM.render(
  <ResourceList
  items={[
    {
      url: '/product',
      attributeOne: 'Product API',
      badges: [
        {content: 'GET'},
        {content: 'PUT'},
        {content: 'POST'},
        {content: 'DELETE'},
      ],
    },
    {
      url: '/order',
      attributeOne: 'Order API',
      badges: [
        {content: 'GET'},
        {content: 'PUT'},
        {content: 'POST'},
        {content: 'DELETE'},
      ],
    },
  ]}
  renderItem={(item, index) => {
      return <ResourceList.Item key={index} {...item} />;
    }}
/>,
document.getElementById('admin-api-list')
);

ReactDOM.render(
  <Heading>SDKs</Heading>,
  document.getElementById('sdks-heading')
);

ReactDOM.render(
  <ResourceList
  items={[
    {
      url: '/hpsdk',
      attributeOne: 'Hosted Payment SDK',
      badges: [
        {content: 'Private'},
      ],
    },
  ]}
  renderItem={(item, index) => {
      return <ResourceList.Item key={index} {...item} />;
    }}
/>,
document.getElementById('sdks-list')
);
