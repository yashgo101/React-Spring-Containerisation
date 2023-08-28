import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import AddEmployees from './components/employees/AddEmployees';
import Home from './components/common/Home';
import Navigation from './components/common/Navigation';
import Employees from './components/employees/Employee';

// import { ApplicationInsights } from '@microsoft/applicationinsights-web'

// const appInsights = new ApplicationInsights({ config: {
//   connectionString: 'InstrumentationKey=a20d3cd5-299f-4b8f-95eb-f3e69695f77a;IngestionEndpoint=https://centralindia-0.in.applicationinsights.azure.com/;LiveEndpoint=https://centralindia.livediagnostics.monitor.azure.com/'
// } });
// appInsights.loadAppInsights();
// appInsights.trackPageView();


function App() {
  return (
    <>
      <Navigation />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/add-employee" element={<AddEmployees />} />
        <Route path="/employees" element={<Employees />} />
      </Routes>
    </>
  );
}

export default App;