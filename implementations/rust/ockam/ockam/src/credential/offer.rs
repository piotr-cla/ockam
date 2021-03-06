use super::CredentialSchema;
use serde::{Deserialize, Serialize};

/// A credential offer is how an issuer informs a potential holder that
/// a credential is available to them
#[derive(Debug, Serialize, Deserialize)]
pub struct CredentialOffer {
    /// The credential offer id is a cryptographic nonce, this must never repeat
    pub id: [u8; 32],
    /// The schema for the credential that the issuer is offering to sign
    pub schema: CredentialSchema,
}
