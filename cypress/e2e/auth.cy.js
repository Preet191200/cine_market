describe('Authentication', () => {
  it('logs in with valid credentials', () => {
    cy.visit('/users/sign_in')
    cy.get('input[name="user[email]"]').type('test@example.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[type="submit"]').click()
    cy.url().should('eq', Cypress.config().baseUrl + '/')
  })

  it('shows error with invalid credentials', () => {
    cy.visit('/users/sign_in')
    cy.get('input[name="user[email]"]').type('test@example.com')
    cy.get('input[name="user[password]"]').type('wrongpassword')
    cy.get('input[type="submit"]').click()
    cy.get('.alert-danger').should('be.visible')
  })

  it('signs up with valid details', () => {
    cy.visit('/users/sign_up')
    cy.get('input[name="user[name]"]').type('Test User')
    cy.get('input[name="user[email]"]').type(`testuser${Date.now()}@example.com`)
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[name="user[password_confirmation]"]').type('password123')
    cy.get('input[type="submit"]').click()
    cy.url().should('eq', Cypress.config().baseUrl + '/')
  })

  it('shows error when passwords do not match', () => {
    cy.visit('/users/sign_up')
    cy.get('input[name="user[name]"]').type('Test User')
    cy.get('input[name="user[email]"]').type('mismatch@example.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[name="user[password_confirmation]"]').type('different123')
    cy.get('input[type="submit"]').click()
    cy.get('.alert-danger').should('be.visible')
  })
})