var React    = require('react');
var ReactDOM = require('react-dom');
import {Page, Card, Button, Layout, FormLayout, TextField, Banner, Heading, ResourceList, TextStyle, DatePicker, Collapsible} from '@shopify/polaris';

ReactDOM.render(
  <Banner title="App Installed">
    <p>Time to start notifying people of things!</p>
  </Banner>,document.getElementById('banner')
);


ReactDOM.render(
  <Layout>
    <Layout.AnnotatedSection
      title="Notification"
      description="This is the notification that will appear on your storefront"
    >
      <Card sectioned>
        <FormLayout>
          <TextField label="Text" />
          <TextField
            type="email"
            label="Call to action link"
          />
        </FormLayout>
      </Card>
    </Layout.AnnotatedSection>
  </Layout>,
  document.getElementById('layout')
);

ReactDOM.render( 
  <Heading>Schedule a notification</Heading>,
  document.getElementById('heading')
);

ReactDOM.render(
    <DatePicker
      month={5}
      year={2017}
    />,
  document.getElementById('resources2')
);
