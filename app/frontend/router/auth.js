export function isAuthenticated() {
  return !!localStorage.getItem('authToken') && !!localStorage.getItem('authedClientUser')
}
