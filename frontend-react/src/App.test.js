import React from 'react';
import { render } from '@testing-library/react';
import App from './App';
 
test('renders cleanup react app message', () => {
  const { getByText } = render(<App />);
  const cleanupMessage = getByText(/All ready to build a React App!/i);
  expect(cleanupMessage).toBeInTheDocument();
});