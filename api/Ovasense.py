import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from imblearn.over_sampling import SMOTE
import joblib

# -------------------------------
# Step 1: Load and preprocess data
# -------------------------------

def load_and_prepare_infertility_data(csv_path):
    df = pd.read_csv(csv_path)

    df.columns = df.columns.str.strip()
    print("Columns available:")
    print(df.columns.tolist())

    # Use only relevant hormonal features
    hormonal_features = ['I_beta_HCG_mIU_mL', 'II_beta_HCG_mIU_mL', 'AMH_ng_mL']

    target_col = 'PCOS_Y_N'

    # Clean column names: remove leading/trailing spaces

    # Clean data
    df.replace('a', np.nan, inplace=True)
    for col in df.columns:
        df[col] = pd.to_numeric(df[col], errors='coerce')

    df = df[hormonal_features + [target_col]]
    df = df.dropna()

    # Features and labels
    X = df[hormonal_features]
    y = df[target_col].round().astype(int)

    return X, y, hormonal_features


# -------------------------------
# Step 2: Train and save model
# -------------------------------

def train_pcos_model(X, y, features,
                     model_path='rf_pcos_model.pkl',
                     scaler_path='rf_scaler.pkl',
                     features_path='hormonal_features.pkl'):
    # Split
    X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y, test_size=0.2, random_state=42)

    # Scale
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)

    # SMOTE
    smote = SMOTE(random_state=42)
    X_train_bal, y_train_bal = smote.fit_resample(X_train_scaled, y_train)

    # Model
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train_bal, y_train_bal)

    # Evaluation
    y_pred = model.predict(X_test_scaled)
    print("📊 Classification Report:")
    print(classification_report(y_test, y_pred))

    # Save
    joblib.dump(model, model_path)
    joblib.dump(scaler, scaler_path)
    joblib.dump(features, features_path)
    print("✅ Model and scaler saved.")

    return model


# -------------------------------
# Step 3: Prediction function
# -------------------------------

def predict_from_hormones(patient_data_dict,
                          model_path='rf_pcos_model.pkl',
                          scaler_path='rf_scaler.pkl',
                          features_path='hormonal_features.pkl'):
    model = joblib.load(model_path)
    scaler = joblib.load(scaler_path)
    features = joblib.load(features_path)

    df = pd.DataFrame([patient_data_dict])

    try:
        df = df[features]  # Ensure correct order
    except KeyError:
        missing = list(set(features) - set(df.columns))
        raise ValueError(f"Missing input values for: {missing}")

    df_scaled = scaler.transform(df)
    pred = model.predict(df_scaled)
    prob = model.predict_proba(df_scaled)

    result = {
        "prediction": int(pred[0]),  # 1 = PCOS, 0 = No PCOS
        "probability": float(prob[0][1])  # Probability of PCOS
    }

    return result


# -------------------------------
# Run everything
# -------------------------------

if __name__ == '__main__':
    # Path to your infertility data
    infertility_path = 'PCOS_infertility_cleaned.csv'

    # Load data
    X, y, hormonal_features = load_and_prepare_infertility_data(infertility_path)

    # Train and save model
    train_pcos_model(X, y, hormonal_features)

    # At this point, the model is ready to be integrated into your app!
